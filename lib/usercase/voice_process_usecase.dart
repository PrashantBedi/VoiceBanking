import "dart:io";
import "dart:typed_data";

import "package:backend_integration/dto/context_from_audio_resp.dart";
import "package:backend_integration/dto/metadata.dart";
import "package:path_provider/path_provider.dart";

import "../common/constants.dart";
import "../model/process_audio.dart";
import "../repository/language_change_repo.dart";
import "../repository/voice_process_repo.dart";
import "../utilities/play_audio/play_audio.dart";

class VoiceProcessUserCase{
  late VoiceProcessRepository repo;
  late LanguageChangeRepo langRepo;

  VoiceProcessUserCase(this.repo, this.langRepo);

  Future<ProcessAudio> processVoice(File file, String lang, MetaData md) async {
    return await repo.processVoice(file, lang, md);
  }

  Future<void> convertToVoice(String result, String lang) async {
    Uint8List audio = await repo.convertToVoice(result, lang);
    var directory = await getApplicationDocumentsDirectory();
    var file = File("${directory.path}/${Constants.receiveAudioFileName}");
    if(file.existsSync()){
      file.delete();
    }
    file = await file.writeAsBytes(audio);
    PlayAudio().playAudio(file.path);
  }

  Future<ProcessAudio> withoutAudio(String lang, MetaData md) {
    return repo.registerUser(lang, md);
  }
}