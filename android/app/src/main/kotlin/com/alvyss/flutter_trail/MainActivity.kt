package com.alvyss.flutter_trail

import android.os.Build
import android.os.Bundle
import android.os.PersistableBundle
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            super.onCreate(savedInstanceState, persistentState)
            this.window.statusBarColor = android.graphics.Color.TRANSPARENT
        }
    }
}
