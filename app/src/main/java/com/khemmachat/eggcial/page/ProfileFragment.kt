package com.khemmachat.eggcial.page

import com.khemmachat.eggcial.EggcialApp
import io.flutter.embedding.android.FlutterFragment

class ProfileFragment : FlutterFragment() {
    override fun getCachedEngineId(): String? {
        return EggcialApp.PROFILE_FLUTTER_ENGINE
    }
}