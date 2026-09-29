package com.likhithpraveenk.storii

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.BitmapShader
import android.graphics.Canvas
import android.graphics.Paint
import android.graphics.RectF
import android.graphics.Shader
import android.widget.RemoteViews
import androidx.core.graphics.createBitmap
import androidx.core.graphics.scale
import androidx.core.net.toUri
import java.io.File

class MediaWidgetProvider : AppWidgetProvider() {

    companion object {
        private const val PREFS_NAME = "widget_prefs"

        fun bindWidget(
            context: Context,
            widgetId: Int,
            itemId: String,
            episodeId: String?,
            coverPath: String?,
        ) {
            val appWidgetManager = AppWidgetManager.getInstance(context)
            val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
            prefs.edit().apply {
                putString("item_id_$widgetId", itemId)
                putString("episode_id_$widgetId", episodeId)
                putString("cover_path_$widgetId", coverPath)
                apply()
            }

            renderWidget(
                context,
                appWidgetManager,
                appWidgetId = widgetId,
                itemId = itemId,
                episodeId = episodeId,
                coverPath = coverPath,
            )
        }

        private fun renderWidget(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetId: Int,
            itemId: String?,
            episodeId: String?,
            coverPath: String?,
        ) {
            val views = RemoteViews(context.packageName, R.layout.widget_media_square)

            if (itemId.isNullOrEmpty()) {
                views.setImageViewResource(R.id.widget_cover, R.drawable.add_rounded)

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
                    views.setImageViewResource(R.id.widget_cover, R.mipmap.ic_launcher)
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
        for (id in appWidgetIds) {
            val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
            val itemId = prefs.getString("item_id_$id", null)
            val coverPath = prefs.getString("cover_path_$id", null)
            val episodeId = prefs.getString("episode_id_$id", null)

            renderWidget(context, appWidgetManager, id, itemId, coverPath, episodeId)
        }
    }

    override fun onDeleted(context: Context, appWidgetIds: IntArray) {
        super.onDeleted(context, appWidgetIds)
        val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        prefs.edit().apply {
            for (id in appWidgetIds) {
                remove("item_id_$id")
                remove("episode_id_$id")
                remove("cover_path_$id")
            }
            apply()
        }
    }
}
