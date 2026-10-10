package com.likhithpraveenk.storii

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.BitmapShader
import android.graphics.Canvas
import android.graphics.Paint
import android.graphics.RectF
import android.graphics.Shader
import android.widget.ProgressBar
import android.widget.RemoteViews
import androidx.core.content.edit
import androidx.core.graphics.createBitmap
import androidx.core.graphics.scale
import androidx.core.net.toUri
import java.io.File

class MediaWidgetProvider : AppWidgetProvider() {

    companion object {
        private const val HOME_WIDGET_PREFS = "HomeWidgetPreferences"

        private fun renderWidget(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetId: Int,
            widgetData: SharedPreferences,
        ) {
            val views = RemoteViews(context.packageName, R.layout.widget_media_square)

            val dataKey = "widget_$appWidgetId"
            val jsonString = widgetData.getString(dataKey, null)

            val itemId = jsonString?.let { parseItemId(it) } ?: ""
            val episodeId = jsonString?.let { parseEpisodeId(it) }
            val coverPath = jsonString?.let { parseCoverPath(it) }
            val progress = jsonString?.let { parseProgress(it) }

            if (itemId.isEmpty()) {
                views.setImageViewResource(R.id.widget_cover, R.drawable.add_rounded)
                views.setViewVisibility(R.id.widget_progress_red, ProgressBar.GONE)
                views.setViewVisibility(R.id.widget_progress_green, ProgressBar.GONE)

                val configureUri = "storii://widget?id=$appWidgetId".toUri()
                val configureIntent = Intent(Intent.ACTION_VIEW, configureUri).apply {
                    setPackage(context.packageName)
                    flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
                }
                val configurePendingIntent = PendingIntent.getActivity(
                    context,
                    appWidgetId,
                    configureIntent,
                    PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
                )
                views.setOnClickPendingIntent(R.id.widget_root, configurePendingIntent)
            } else {
                val bitmap = loadDownsampledBitmap(coverPath)
                if (bitmap != null) {
                    val roundCover = roundBitmap(context, bitmap)
                    bitmap.recycle()
                    views.setImageViewBitmap(R.id.widget_cover, roundCover)
                } else {
                    views.setImageViewResource(R.id.widget_cover, R.mipmap.ic_launcher_foreground)
                }

                if (progress != null && progress > 0) {
                    val isGreen = progress >= 1.0
                    views.setViewVisibility(
                        R.id.widget_progress_green,
                        if (isGreen) ProgressBar.VISIBLE else ProgressBar.GONE
                    )
                    views.setViewVisibility(
                        R.id.widget_progress_red,
                        if (isGreen) ProgressBar.GONE else ProgressBar.VISIBLE
                    )
                    views.setProgressBar(
                        if (isGreen) R.id.widget_progress_green else R.id.widget_progress_red,
                        10000,
                        (progress * 10000).toInt().coerceAtMost(10000),
                        false
                    )
                } else {
                    views.setViewVisibility(R.id.widget_progress_red, ProgressBar.GONE)
                    views.setViewVisibility(R.id.widget_progress_green, ProgressBar.GONE)
                }

                val deepLinkUri = if (!episodeId.isNullOrEmpty()) {
                    "storii://play?id=$itemId&episodeId=$episodeId".toUri()
                } else {
                    "storii://play?id=$itemId".toUri()
                }

                val intent = Intent(Intent.ACTION_VIEW, deepLinkUri).apply {
                    setPackage(context.packageName)
                    flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
                }

                val pendingIntent = PendingIntent.getActivity(
                    context,
                    appWidgetId,
                    intent,
                    PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
                )
                views.setOnClickPendingIntent(R.id.widget_root, pendingIntent)
            }

            appWidgetManager.updateAppWidget(appWidgetId, views)
        }

        private fun parseItemId(jsonString: String): String {
            return try {
                val start = jsonString.indexOf("\"itemId\":\"") + 10
                val end = jsonString.indexOf("\"", start)
                if (start in 10..<end) jsonString.substring(start, end) else ""
            } catch (_: Exception) {
                ""
            }
        }

        private fun parseEpisodeId(jsonString: String): String? {
            return try {
                val start = jsonString.indexOf("\"episodeId\":\"") + 13
                val end = jsonString.indexOf("\"", start)
                if (start in 13..<end) jsonString.substring(start, end) else null
            } catch (_: Exception) {
                null
            }
        }

        private fun parseCoverPath(jsonString: String): String? {
            return try {
                val start = jsonString.indexOf("\"coverPath\":\"") + 13
                val end = jsonString.indexOf("\"", start)
                if (start in 13..<end) jsonString.substring(start, end) else null
            } catch (_: Exception) {
                null
            }
        }

        private fun parseProgress(jsonString: String): Double? {
            return try {
                val start = jsonString.indexOf("\"progress\":") + 11
                val end = jsonString.indexOf(",", start)
                if (end == -1) {
                    val endBrace = jsonString.indexOf("}", start)
                    if (start in 11..<endBrace) jsonString.substring(start, endBrace)
                        .toDouble() else null
                } else if (start in 11..<end) {
                    jsonString.substring(start, end).toDouble()
                } else null
            } catch (_: Exception) {
                null
            }
        }

        private fun loadDownsampledBitmap(coverPath: String?): Bitmap? {
            val maxImageSizePx = 500
            if (coverPath.isNullOrBlank()) return null

            val imageFile = File(coverPath)
            if (!imageFile.exists()) return null

            return try {
                val imageBoundsOptions = BitmapFactory.Options().apply {
                    inJustDecodeBounds = true
                }
                BitmapFactory.decodeFile(coverPath, imageBoundsOptions)

                var sampleSizeMultiplier = 1
                val maxDim = maxOf(imageBoundsOptions.outWidth, imageBoundsOptions.outHeight)
                while (maxDim / sampleSizeMultiplier > maxImageSizePx * 2) {
                    sampleSizeMultiplier *= 2
                }

                val decodeOptions = BitmapFactory.Options().apply {
                    inSampleSize = sampleSizeMultiplier
                    inPreferredConfig = Bitmap.Config.ARGB_8888
                }
                val bitmap = BitmapFactory.decodeFile(coverPath, decodeOptions) ?: return null

                if (bitmap.width != maxImageSizePx || bitmap.height != maxImageSizePx) {
                    bitmap.scale(maxImageSizePx, maxImageSizePx)
                } else {
                    bitmap
                }
            } catch (_: Exception) {
                null
            }
        }

        private fun roundBitmap(context: Context, bitmap: Bitmap): Bitmap {
            val radiusPx = 12f * context.resources.displayMetrics.density
            val output = createBitmap(bitmap.width, bitmap.height)

            val paint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
                shader = BitmapShader(bitmap, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP)
            }
            val rect = RectF(0f, 0f, bitmap.width.toFloat(), bitmap.height.toFloat())

            Canvas(output).drawRoundRect(rect, radiusPx, radiusPx, paint)
            return output
        }
    }


    override fun onUpdate(
        context: Context, appWidgetManager: AppWidgetManager, appWidgetIds: IntArray
    ) {
        val widgetData = context.getSharedPreferences(HOME_WIDGET_PREFS, Context.MODE_PRIVATE)
        for (id in appWidgetIds) {
            renderWidget(context, appWidgetManager, id, widgetData)
        }
    }

    override fun onDeleted(context: Context, appWidgetIds: IntArray) {
        super.onDeleted(context, appWidgetIds)
        context.getSharedPreferences(HOME_WIDGET_PREFS, Context.MODE_PRIVATE).edit {
            for (id in appWidgetIds) {
                remove("widget_$id")
            }
        }
    }
}
