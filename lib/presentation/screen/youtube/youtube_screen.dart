import 'package:flutter/material.dart';
import 'package:youtube_lite_webview/core/constant/app_colors.dart';
import 'package:youtube_lite_webview/presentation/core/widget/webView_wrapper.dart';

class YoutubeScreen extends StatelessWidget {
  const YoutubeScreen({super.key, required this.title, required this.url});

  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        elevation: 0,
        title: Text(
          title,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: AppColors.textPrimary),
          ),
        ],
      ),
      body: WebViewWrapper(title: title, url: url),
    );
  }
}
