import 'package:flutter/material.dart';
import 'package:simple_youtube_player_iframe/simple_youtube_player_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

class SimpleYoutubePlayerIframe extends StatefulWidget {
  final Color backgroundColor;
  final YoutubePlayerController youtubePlayerController;
  const SimpleYoutubePlayerIframe({
    super.key,
    required this.youtubePlayerController,
    this.backgroundColor = Colors.black,
  });

  @override
  State<StatefulWidget> createState() {
    return SimpleYoutubePlayerIframeState();
  }
}

class SimpleYoutubePlayerIframeState extends State<SimpleYoutubePlayerIframe> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }
    controller = WebViewController.fromPlatformCreationParams(
      params,
    );
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(
        false,
      );
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(
        false,
      );
    }

    controller.setJavaScriptMode(
      JavaScriptMode.unrestricted,
    );
    controller.setBackgroundColor(
      widget.backgroundColor,
    );
    controller.setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          return NavigationDecision.prevent;
        },
      ),
    );
    controller.loadRequest(
      Uri.parse(
        widget.youtubePlayerController.getVideoURL(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: controller,
    );
  }

  void playVideo() {
    controller.runJavaScript('playVideo');
  }

  void pauseVideo() {
    controller.runJavaScript('pauseVideo');
  }

  void stopVideo() {
    controller.runJavaScript('pauseVideo');
  }

  void muteVideo() {
    controller.runJavaScript('mute');
  }

  void unMuteVideo() {
    controller.runJavaScript('unMute');
  }

  Future<int> getVolume() {
    return controller.runJavaScriptReturningResult('getVolume') as Future<int>;
  }

  Future<bool> isPlayingVideo() async {
    int state = await (controller.runJavaScriptReturningResult('getPlayerState')
        as Future<int>);
    return state == 1;
  }

  void seekTo(double seconds) {
    controller.runJavaScript('setVolume($seconds)');
  }

  void setVolume(int value) {
    controller.runJavaScript('setVolume($value)');
  }

  Future<Duration> getDuration() async {
    final double duration = await (controller
        .runJavaScriptReturningResult('getDuration') as Future<double>);
    return Duration(milliseconds: (duration * 1000).toInt());
  }
}
