import 'package:flutter_test/flutter_test.dart';
import 'package:simple_youtube_player_iframe/simple_youtube_player_controller.dart';

import 'package:simple_youtube_player_iframe/simple_youtube_player_iframe.dart';
import 'package:simple_youtube_player_iframe/simple_youtube_player_vars.dart';

void main() {
  testWidgets('Plays video', (tester) async {
    YoutubePlayerController contoller = YoutubePlayerController(
      youtubeVideoId: 'wPeBEO1KHKg',
      playerVars: SimpleYoutubePlayerVars(
        autoPlay: true,
      ),
    );
    await tester.pumpWidget(
      SimpleYoutubePlayerIframe(
        youtubePlayerController: contoller,
      ),
    );

    for (var element in tester.allWidgets) {
      print(
        element.runtimeType,
      );
    }
  });
}
