import 'package:flutter/material.dart';
import 'package:youtube_lite_webview/core/constant/app_colors.dart';

class FullScreenLoadingWidget extends StatelessWidget {
  const FullScreenLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColors.loadingOverlay.withValues(alpha: 0.55),
      child: const Center(
        child: CircularProgressIndicator(color: AppColors.youtubePrimary),
      ),
    );
  }
}
