package com.khemmachat.eggcial

import android.app.Application
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.view.FlutterMain

class EggcialApp : Application() {
    companion object {
        const val MESSAGE_FLUTTER_ENGINE = "message_flutter_engine"
        const val PROFILE_FLUTTER_ENGINE = "profile_flutter_engine"
    }

    override fun onCreate() {
        super.onCreate()

        val messageFlutterEngine = FlutterEngine(this)
        val profileFlutterEngine = FlutterEngine(this)

        messageFlutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint(FlutterMain.findAppBundlePath(), "message")
        )
        profileFlutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint(FlutterMain.findAppBundlePath(), "profile")
        )

        FlutterEngineCache
            .getInstance()
            .put(MESSAGE_FLUTTER_ENGINE, messageFlutterEngine)
        FlutterEngineCache
            .getInstance()
            .put(PROFILE_FLUTTER_ENGINE, profileFlutterEngine)
    }
}