import 'package:flutter/material.dart';
import 'package:youtube_lite_webview/core/constant/app_colors.dart';
import 'package:youtube_lite_webview/core/constant/app_strings.dart';
import 'package:youtube_lite_webview/presentation/screen/home/widget/youtube_nav_file.dart';
import 'package:youtube_lite_webview/presentation/screen/youtube/youtube_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _openUrl(String title, String url) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => YoutubeScreen(title: title, url: url),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        elevation: 0,
        title: Row(
          children: [
            Container(
              height: 25,
              width: 35,
              decoration: BoxDecoration(
                color: AppColors.youtubePrimary,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(Icons.play_arrow, color: AppColors.iconDefault)),
            const SizedBox(width: 8),
            Text(
              AppStrings.appName,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: AppColors.textPrimary),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        children: [
          _buildSectionHeader(AppStrings.sectionBrowse),
          YoutubeNavFile(
            icon: Icons.home,
            label: AppStrings.navHome,
            onTap: () =>
                _openUrl(AppStrings.navHome, 'https://www.youtube.com/'),
          ),
          YoutubeNavFile(
            icon: Icons.arrow_back_ios_rounded,
            label: AppStrings.navShorts,
            onTap: () => _openUrl(
              AppStrings.navShorts,
              'https://www.youtube.com/shorts/',
            ),
          ),
          YoutubeNavFile(
            icon: Icons.subscriptions,
            label: AppStrings.navSubscriptions,
            onTap: () => _openUrl(
              AppStrings.navSubscriptions,
              'https://www.youtube.com/feed/subscriptions',
            ),
          ),
          YoutubeNavFile(
            icon: Icons.abc,
            label: AppStrings.navExplore,
            onTap: () => _openUrl(
              AppStrings.navExplore,
              'https://www.youtube.com/feed/explore',
            ),
          ),
          YoutubeNavFile(
            icon: Icons.abc,
            label: AppStrings.navTrending,
            onTap: () => _openUrl(
              AppStrings.navTrending,
              'https://www.youtube.com/feed/trending',
            ),
          ),
          const Divider(color: AppColors.divider),
          _buildSectionHeader(AppStrings.sectionLibrary),
          YoutubeNavFile(
            icon: Icons.history,
            label: AppStrings.navHistory,
            onTap: () => _openUrl(
              AppStrings.navHistory,
              'https://www.youtube.com/feed/history',
            ),
          ),
          YoutubeNavFile(
            icon: Icons.abc,
            label: AppStrings.navWatchLater,
            onTap: () => _openUrl(
              AppStrings.navWatchLater,
              'https://www.youtube.com/playlist?list=WL',
            ),
          ),
          YoutubeNavFile(
            icon: Icons.abc,
            label: AppStrings.navLikedVideos,
            onTap: () => _openUrl(
              AppStrings.navLikedVideos,
              'https://www.youtube.com/playlist?list=LL',
            ),
          ),
          const Divider(color: AppColors.divider),
          _buildSectionHeader(AppStrings.sectionMore),
          YoutubeNavFile(
            icon: Icons.settings,
            label: AppStrings.navSettings,
            onTap: () => _openUrl(
              AppStrings.navSettings,
              'https://www.youtube.com/account',
            ),
          ),
          YoutubeNavFile(
            icon: Icons.help,
            label: AppStrings.navHelp,
            onTap: () => _openUrl(
              AppStrings.navHelp,
              'https://support.google.com/youtube',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 4, bottom: 6),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.textHint,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
