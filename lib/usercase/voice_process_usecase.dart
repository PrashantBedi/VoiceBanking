import "dart:io";
import "dart:typed_data";

import "package:path_provider/path_provider.dart";

import "../repository/voice_process_repo.dart";
import "../utilities/play_audio/play_audio.dart";

class VoiceProcessUserCase{
  late VoiceProcessRepository repo;

  VoiceProcessUserCase(this.repo);

  String processVoice() {
    return repo.processVoice();
  }

  String performAction() {
    return repo.performAction();
  }

  Future<String> convertToVoice(String result) async {
    Uint8List audio = await repo.convertToVoice(result);
    var directory = await getApplicationDocumentsDirectory();
    var file = File("${directory.path}/tts.wav");
    file = await file.writeAsBytes(audio);
    PlayAudio().playAudio(file.path);
    return file.path;
  }
}