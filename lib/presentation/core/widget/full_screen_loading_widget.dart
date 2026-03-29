import 'package:flutter/material.dart';
import 'package:youtube_lite_webview/core/constant/app_colors.dart';

class FullScreenLoadingWidget extends StatelessWidget {
  const FullScreenLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: .infinity,
          width: .infinity,
          color: AppColors.surfaceDark,
          
        ),
      ],
    );
  }
}