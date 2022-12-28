class SimpleYoutubePlayerVars {
  final bool autoPlay;
  final bool showControls;
  final int playInline = 1;
  final bool modestBranding;
  final bool fullScreen;
  final int disableKb;

  SimpleYoutubePlayerVars({
    this.autoPlay = false,
    this.showControls = true,
    this.modestBranding = true,
    this.fullScreen = true,
    this.disableKb = 1,
  });

  Map<String, dynamic> toMap() {
    return {
      'autoplay': boolToInt(autoPlay),
      'controls': boolToInt(showControls),
      'playsinline': playInline,
      'iv_load_policy': 3,
      'modestbranding': boolToInt(modestBranding),
      'fs': boolToInt(fullScreen),
      'disablekb': disableKb,
    };
  }

  int boolToInt(bool val) => val ? 1 : 0;
}