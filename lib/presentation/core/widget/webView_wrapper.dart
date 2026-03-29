import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_lite_webview/presentation/core/widget/full_screen_loading_widget.dart';

class WebViewWrapper extends StatefulWidget {
  const WebViewWrapper({super.key, required this.url, required this.title});

  final String url;
  final String title;

  @override
  State<WebViewWrapper> createState() => _WebViewWrapperState();
}

class _WebViewWrapperState extends State<WebViewWrapper> {
  late final WebViewController controller;
  final ValueNotifier<bool> _isLoading = ValueNotifier(true);

  Future<void> _hideYoutubeMasthead() async {
    const script = '''
      (function () {
        var styleId = 'yt-lite-hide-masthead-style';
        if (document.getElementById(styleId)) return;

        var style = document.createElement('style');
        style.id = styleId;
        style.textContent = `
          ytd-masthead,
          #masthead-container,
          #container.style-scope.ytd-masthead,
          #start.style-scope.ytd-masthead,
          #center.style-scope.ytd-masthead,
          #end.style-scope.ytd-masthead,
          ytm-mobile-topbar-renderer,
          .mobile-topbar-header-content {
            display: none !important;
            visibility: hidden !important;
            height: 0 !important;
            min-height: 0 !important;
          }

          ytd-app,
          ytd-page-manager,
          #content,
          #page-manager,
          #contents {
            margin-top: 0 !important;
            padding-top: 0 !important;
          }
        `;

        document.head.appendChild(style);
      })();
    ''';

    await controller.runJavaScript(script);
  }

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String _) => _isLoading.value = true,
          onPageFinished: (String _) async {
            await _hideYoutubeMasthead();
            _isLoading.value = false;
          },
          onWebResourceError: (WebResourceError _) => _isLoading.value = false,
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/') ||
                request.url.startsWith('https://m.youtube.com/') ||
                request.url.startsWith('https://accounts.google.com/')) {
              return NavigationDecision.navigate;
            }
            return NavigationDecision.prevent;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  void dispose() {
    _isLoading.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isLoading,
      builder: (context, value, child) {
        return Stack(
          children: [
            WebViewWidget(controller: controller),
            if (value) const FullScreenLoadingWidget(),
          ],
        );
      },
    );
  }
}
