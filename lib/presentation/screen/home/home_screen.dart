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
      backgroundColor: AppColors.surfaceDark,
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.play_arrow,color: Colors.white,),
            Text(AppStrings.appName,),




          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search,color: Colors.black,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications,color: Colors.black,)),

        ],
        
      
      ),
      body: ListView(
        children: [
          _buildSectionHeader(AppStrings.sectionBrowse),
          YoutubeNavFile(
            icon: Icons.home,
            label: AppStrings.navHome,
            onTap: () => _openUrl(AppStrings.navHome, 'https://www.youtube.com/'),
          ),
          YoutubeNavFile(
            icon: Icons.arrow_back_ios_rounded,
            label: AppStrings.navShorts,
            onTap: () =>
                _openUrl(AppStrings.navShorts, 'https://www.youtube.com/shorts/'),
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
            onTap: () =>
                _openUrl(AppStrings.navExplore, 'https://www.youtube.com/feed/explore'),
          ),
          YoutubeNavFile(
            icon: Icons.abc,
            label: AppStrings.navTrending,
            onTap: () =>
                _openUrl(AppStrings.navTrending, 'https://www.youtube.com/feed/trending'),
          ),
          

          _buildSectionHeader(AppStrings.sectionLibrary),
          YoutubeNavFile(
            icon: Icons.abc,
            label: AppStrings.navHistory,
            onTap: () =>
                _openUrl(AppStrings.navHistory, 'https://www.youtube.com/feed/history'),
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
          _buildSectionHeader(AppStrings.sectionMore),
          YoutubeNavFile(
            icon: Icons.settings,
            label: AppStrings.navSettings,
            onTap: () => _openUrl(AppStrings.navSettings, 'https://www.youtube.com/account'),
          ),
          YoutubeNavFile(
            icon: Icons.question_mark,
            label: AppStrings.navHelp,
            onTap: () =>
                _openUrl(AppStrings.navHelp, 'https://support.google.com/youtube'),
          ),
          
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.textHint,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

}