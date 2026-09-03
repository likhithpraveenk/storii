package com.likhithpraveenk.storii

import android.content.ContentProvider
import android.content.ContentValues
import android.database.Cursor
import android.database.MatrixCursor
import android.net.Uri
import android.os.ParcelFileDescriptor
import android.util.Base64
import android.util.Log
import androidx.core.net.toUri
import java.io.File
import java.io.FileNotFoundException
import java.io.IOException
import java.net.HttpURLConnection
import java.net.URL

class CoversContentProvider : ContentProvider() {
    companion object {
        private const val TAG = "CoversContentProvider"
    }

    override fun onCreate(): Boolean = true

    override fun getType(uri: Uri): String = "image/*"

    override fun query(
        uri: Uri,
        projection: Array<out String>?,
        selection: String?,
        selectionArgs: Array<out String>?,
        sortOrder: String?,
    ): Cursor {
        return MatrixCursor(arrayOf("url")).apply {
            addRow(arrayOf(uri.toString()))
        }
    }

    override fun openFile(uri: Uri, mode: String): ParcelFileDescriptor? {
        require(mode == "r") { "Only read mode supported" }

        val source = decodeSource(uri) ?: return null
        val sourceUri = source.toUri()
        val scheme = sourceUri.scheme?.lowercase()

        val pipe = ParcelFileDescriptor.createPipe()
        val output = ParcelFileDescriptor.AutoCloseOutputStream(pipe[1])

        Thread {
            try {
                when (scheme) {
                    "http", "https" -> download(sourceUri, output)

                    "file" -> {
                        val file = File(sourceUri.path ?: return@Thread)
                        file.inputStream().use { input ->
                            input.copyTo(output)
                        }
                    }

                    null -> {
                        File(source).inputStream().use { input ->
                            input.copyTo(output)
                        }
                    }

                    else -> {
                        throw FileNotFoundException(
                            "Unsupported source scheme: $scheme"
                        )
                    }
                }
            } catch (e: Exception) {
                Log.e(TAG, "Failed to open $uri", e)
            } finally {
                output.close()
            }
        }.start()

        return pipe[0]
    }

    override fun insert(uri: Uri, values: ContentValues?): Uri? = null

    override fun delete(
        uri: Uri,
        selection: String?,
        selectionArgs: Array<out String>?,
    ): Int = 0

    override fun update(
        uri: Uri,
        values: ContentValues?,
        selection: String?,
        selectionArgs: Array<out String>?,
    ): Int = 0

    private fun download(uri: Uri, output: java.io.OutputStream) {
        val connection = (URL(uri.toString()).openConnection() as HttpURLConnection).apply {
            connectTimeout = 15_000
            readTimeout = 15_000
            instanceFollowRedirects = true
        }
        try {
            connection.connect()
            if (connection.responseCode !in 200..299) {
                throw IOException(
                    "HTTP ${connection.responseCode}: ${connection.responseMessage}"
                )
            }
            connection.inputStream.use { input -> input.copyTo(output) }
        } finally {
            connection.disconnect()
        }
    }

    private fun decodeSource(uri: Uri): String? {
        val encoded = uri.lastPathSegment ?: return null
        return try {
            String(
                Base64.decode(
                    encoded,
                    Base64.URL_SAFE or Base64.NO_PADDING or Base64.NO_WRAP,
                ),
                Charsets.UTF_8,
            )
        } catch (e: IllegalArgumentException) {
            Log.e(TAG, "Invalid source URI: $uri", e)
            null
        }
    }
}