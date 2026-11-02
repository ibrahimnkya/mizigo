package com.mizigo.app

import android.os.Build
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        // Keep the OS launch screen in step with the theme saved by the app.
        applyLaunchTheme(savedThemeMode())
        super.onCreate(savedInstanceState)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        // ThemeProvider calls this when the user switches theme, so the very
        // next cold start already shows the new launch background.
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "mizigo/launch_theme")
            .setMethodCallHandler { call, result ->
                if (call.method == "set") {
                    applyLaunchTheme(call.arguments as? String)
                    result.success(null)
                } else {
                    result.notImplemented()
                }
            }
    }

    /** Theme saved by Flutter's shared_preferences ("mizigo_theme_mode"). */
    private fun savedThemeMode(): String? =
        getSharedPreferences("FlutterSharedPreferences", MODE_PRIVATE)
            .getString("flutter.mizigo_theme_mode", null)

    /** Android 13+ only; older versions keep the default (maroon) launch screen. */
    private fun applyLaunchTheme(mode: String?) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) return
        val style = when (mode) {
            "midnight" -> R.style.LaunchTheme_Midnight
            "light" -> R.style.LaunchTheme_Daylight
            else -> R.style.LaunchTheme
        }
        splashScreen.setSplashScreenTheme(style)
    }
}
