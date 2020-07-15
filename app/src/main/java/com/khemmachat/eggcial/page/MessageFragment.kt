package com.khemmachat.eggcial.page

import android.widget.Toast
import com.khemmachat.eggcial.EggcialApp
import io.flutter.embedding.android.FlutterFragment
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MessageFragment : FlutterFragment() {
    companion object {
        private const val CHANNEL = "com.eggcial/message"
        lateinit var platform: MethodChannel
    }

    override fun getCachedEngineId(): String? {
        return EggcialApp.MESSAGE_FLUTTER_ENGINE
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        platform = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        )
        platform.setMethodCallHandler { call, result ->
            when (call.method) {
                "send" -> {
                    Toast.makeText(context, "Successful", Toast.LENGTH_SHORT).show()
                }
            }
        }
    }
}