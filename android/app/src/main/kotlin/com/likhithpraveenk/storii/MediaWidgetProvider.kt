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
import android.view.View
import android.widget.RemoteViews
import androidx.core.content.edit
import androidx.core.graphics.createBitmap
import androidx.core.graphics.scale
import androidx.core.net.toUri
import org.json.JSONException
import org.json.JSONObject
import java.io.File


class MediaWidgetProvider : AppWidgetProvider() {
    companion object {
        private const val HOME_WIDGET_PREFS = "HomeWidgetPreferences"
        private const val STATE_NONE = "none"
        private const val STATE_LOADING = "loading"
        private const val STATE_PLAYING = "playing"

        private fun renderWidget(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetId: Int,
            widgetData: SharedPreferences,
        ) {
            val views = RemoteViews(context.packageName, R.layout.widget_media_square)

            val dataKey = "widget_$appWidgetId"
            val config = widgetData.getString(dataKey, null)?.let { parseWidgetConfig(it) }

            val itemId = config?.itemId
            val episodeId = config?.episodeId
            val coverPath = config?.coverPath
            val progress = config?.progress

            if (itemId == null) {
                views.setViewVisibility(R.id.widget_cover, View.GONE)
                views.setViewVisibility(R.id.widget_setup_text, View.VISIBLE)
                views.setViewVisibility(R.id.widget_progress_red, View.GONE)
                views.setViewVisibility(R.id.widget_progress_green, View.GONE)
                views.setViewVisibility(R.id.widget_badge, View.GONE)

                val configureUri = "storii://widget?id=$appWidgetId".toUri()
                val configureIntent = Intent(Intent.ACTION_VIEW, configureUri).apply {
                    setPackage(context.packageName)
                    flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
                }
                val configurePendingIntent = PendingIntent.getActivity(
                    context,
                    appWidgetId,
                    configureIntent,
                    PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
                )
                views.setOnClickPendingIntent(R.id.widget_root, configurePendingIntent)
            } else if (itemId.isEmpty()) {
                views.setViewVisibility(R.id.widget_cover, View.VISIBLE)
                views.setImageViewResource(R.id.widget_cover, R.mipmap.ic_launcher_foreground)
                views.setViewVisibility(R.id.widget_setup_text, View.GONE)
                views.setViewVisibility(R.id.widget_progress_red, View.GONE)
                views.setViewVisibility(R.id.widget_progress_green, View.GONE)
                views.setViewVisibility(R.id.widget_badge, View.GONE)

                val configureUri = "storii:///home".toUri()
                val configureIntent = Intent(Intent.ACTION_VIEW, configureUri).apply {
                    setPackage(context.packageName)
                    flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
                }
                val configurePendingIntent = PendingIntent.getActivity(
                    context,
                    appWidgetId,
                    configureIntent,
                    PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
                )
                views.setOnClickPendingIntent(R.id.widget_root, configurePendingIntent)
            } else {
                views.setViewVisibility(R.id.widget_cover, View.VISIBLE)
                views.setViewVisibility(R.id.widget_setup_text, View.GONE)
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
                        R.id.widget_progress_green, if (isGreen) View.VISIBLE else View.GONE
                    )
                    views.setViewVisibility(
                        R.id.widget_progress_red, if (isGreen) View.GONE else View.VISIBLE
                    )
                    views.setProgressBar(
                        if (isGreen) R.id.widget_progress_green else R.id.widget_progress_red,
                        10000,
                        (progress * 10000).toInt().coerceAtMost(10000),
                        false
                    )
                } else {
                    views.setViewVisibility(R.id.widget_progress_red, View.GONE)
                    views.setViewVisibility(R.id.widget_progress_green, View.GONE)
                }

                val itemIntent =
                    Intent(Intent.ACTION_VIEW, "storii:///item/$itemId".toUri()).apply {
                        setPackage(context.packageName)
                        flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
                    }
                val itemPendingIntent = PendingIntent.getActivity(
                    context,
                    appWidgetId,
                    itemIntent,
                    PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
                )
                views.setOnClickPendingIntent(R.id.widget_root, itemPendingIntent)

                val playIntent = Intent(context, WidgetPlayReceiver::class.java).apply {
                    putExtra(WidgetPlayReceiver.EXTRA_LIBRARY_ITEM_ID, itemId)
                    putExtra(WidgetPlayReceiver.EXTRA_EPISODE_ID, episodeId)
                }
                val playPendingIntent = PendingIntent.getBroadcast(
                    context,
                    appWidgetId,
                    playIntent,
                    PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
                )
                views.setOnClickPendingIntent(R.id.widget_badge, playPendingIntent)

                val state = config.state
                if (state == STATE_LOADING) {
                    views.setViewVisibility(R.id.widget_badge_loading, View.VISIBLE)
                    views.setViewVisibility(R.id.widget_badge, View.GONE)
                } else {
                    views.setViewVisibility(R.id.widget_badge_loading, View.GONE)
                    views.setViewVisibility(R.id.widget_badge, View.VISIBLE)
                    views.setImageViewResource(
                        R.id.widget_badge, if (state == STATE_PLAYING) {
                            R.drawable.widget_badge_pause
                        } else {
                            R.drawable.widget_badge_play
                        }
                    )
                }
            }

            appWidgetManager.updateAppWidget(appWidgetId, views)
        }

        private class WidgetConfigData(
            val itemId: String,
            val episodeId: String?,
            val coverPath: String?,
            val progress: Double?,
            val state: String,
        )

        private fun parseWidgetConfig(jsonString: String): WidgetConfigData? = try {
            val json = JSONObject(jsonString)
            WidgetConfigData(
                itemId = json.optString("itemId"),
                episodeId = json.optString("episodeId").takeIf { it.isNotEmpty() },
                coverPath = json.optString("coverPath").takeIf { it.isNotBlank() },
                progress = json.optDouble("progress").takeIf { !it.isNaN() },
                state = json.optString("state").takeIf { it.isNotEmpty() } ?: STATE_NONE,
            )
        } catch (_: JSONException) {
            null
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

                if (bitmap.width == maxImageSizePx && bitmap.height == maxImageSizePx) {
                    return bitmap
                }
                val scaled = bitmap.scale(maxImageSizePx, maxImageSizePx)
                bitmap.recycle()
                return scaled
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
