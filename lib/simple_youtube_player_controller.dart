import 'package:simple_youtube_player_iframe/simple_youtube_player_iframe.dart';
import 'package:simple_youtube_player_iframe/simple_youtube_player_vars.dart';

class YoutubePlayerController {
  late SimpleYoutubePlayerIframeState _simpleYoutubePlayerState;
  final String _youtubeUrl = "https://www.youtube.com/embed/";
  final String youtubeVideoId;
  final bool mute;
  final Duration? startAt;
  final SimpleYoutubePlayerVars? playerVars;

  YoutubePlayerController({
    required this.youtubeVideoId,
    this.mute = false,
    this.startAt,
    this.playerVars,
  });

  void playVideo() {
    _simpleYoutubePlayerState.playVideo();
  }

  void pauseVideo() {
    _simpleYoutubePlayerState.pauseVideo();
  }

  void stopVideo() {
    _simpleYoutubePlayerState.pauseVideo();
  }

  void muteVideo() async {
    _simpleYoutubePlayerState.muteVideo();
  }

  void unMuteVideo() async {
    _simpleYoutubePlayerState.unMuteVideo();
  }

  void setVolume(int value) {
    _simpleYoutubePlayerState.setVolume(value);
  }

  void seekTo(Duration duration) {
    _simpleYoutubePlayerState.seekTo(duration.inMilliseconds / 1000);
  }

  Future<int> getVolume() {
    return _simpleYoutubePlayerState.getVolume();
  }

  Future<bool> isPlaying() async{
    return await _simpleYoutubePlayerState.isPlayingVideo();
  }

  String getVideoURL() {
    return "$_youtubeUrl$youtubeVideoId";
  }
}