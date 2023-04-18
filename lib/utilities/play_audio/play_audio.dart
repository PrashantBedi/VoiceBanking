import "package:assets_audio_player/assets_audio_player.dart";

class PlayAudio{
  void playAudio(String filePath) async {
    await AssetsAudioPlayer.newPlayer().open(
      Audio.file(filePath),
      autoStart: true,
      showNotification: false,

    );
  }
}