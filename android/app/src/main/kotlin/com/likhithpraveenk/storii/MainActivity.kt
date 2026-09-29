package com.likhithpraveenk.storii

import com.ryanheise.audioservice.AudioServiceActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : AudioServiceActivity() {

    companion object {
        private const val CHANNEL = "com.likhithpraveenk.storii/widget"

    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "bindWidget" -> {
                        val widgetId = call.argument<Int>("widgetId") ?: -1
                        val itemId = call.argument<String>("itemId")
                        val episodeId = call.argument<String?>("episodeId")
                        val coverPath = call.argument<String?>("coverPath")
                        if (widgetId == -1 || itemId.isNullOrBlank()) {
                            result.error("error", "widgetId and itemId cannot be null", null)
                            return@setMethodCallHandler
                        }
                        MediaWidgetProvider.bindWidget(
                            context = applicationContext,
                            widgetId = widgetId,
                            itemId = itemId,
                            episodeId = episodeId,
                            coverPath = coverPath,
                        )
                        result.success(true)
                    }

                    else -> result.notImplemented()
                }
            }
    }
}
