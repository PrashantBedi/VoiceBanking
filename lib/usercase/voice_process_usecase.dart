import "dart:io";
import "dart:typed_data";

import "package:alpha/model/language.dart";
import "package:backend_integration/dto/context_from_audio_resp.dart";
import "package:path_provider/path_provider.dart";

import "../repository/language_change_repo.dart";
import "../repository/voice_process_repo.dart";
import "../utilities/play_audio/play_audio.dart";

class VoiceProcessUserCase{
  late VoiceProcessRepository repo;
  late LanguageChangeRepo langRepo;

  VoiceProcessUserCase(this.repo, this.langRepo);

  Future<String> processVoice(File file, String lang) async {
    ContextFromAudioResp resp = await repo.processVoice(file, lang);
    return "Check Balance";
  }

  String performAction() {
    return repo.performAction();
  }

  Future<void> convertToVoice(String result) async {
    Uint8List audio = await repo.convertToVoice(result);
    var directory = await getApplicationDocumentsDirectory();
    var file = File("${directory.path}/tts.wav");
    file = await file.writeAsBytes(audio);
    PlayAudio().playAudio(file.path);
  }
}