import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:youtube_lite_webview/core/constant/app_colors.dart';
import 'package:youtube_lite_webview/presentation/screen/home/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (WebViewPlatform.instance == null) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        WebViewPlatform.instance = AndroidWebViewPlatform();
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        WebViewPlatform.instance = WebKitWebViewPlatform();
      case TargetPlatform.windows:
      case TargetPlatform.linux:
      case TargetPlatform.fuchsia:
        break;
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YouTube Lite',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.youtubePrimary),
        scaffoldBackgroundColor: AppColors.backgroundDark,
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            foregroundColor: AppColors.iconDefault,
          ),
      ),),
      home: const HomeScreen(),
    );
  }
}
