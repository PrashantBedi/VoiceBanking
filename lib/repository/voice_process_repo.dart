import "dart:io";
import "dart:typed_data";

import "package:assets_audio_player/assets_audio_player.dart";
import "package:backend_integration/dto/text_to_voice_req.dart";
import "package:backend_integration/dto/text_to_voice_resp.dart";
import "package:backend_integration/endpoint/process_audio.dart";
import "package:backend_integration/endpoint/text_to_voice.dart";
import "package:dio/dio.dart";

class VoiceProcessRepository {
  late TextToVoiceAPI ttv;
  late ProcessAudioAPI pa;

  VoiceProcessRepository(this.ttv, this.pa);

  String processVoice(File file) {
    pa.getContextFromAudio("foo", "english", file);
    return "What's my bank balance";
  }

  String performAction() {
    // Call endpoint to get result
    return "Your bank balance is 5000";
  }

  Future<Uint8List> convertToVoice(String result) async {
    late TextToVoiceResp textToVoice;
    try {
      textToVoice = await ttv.textToVoice(
        TextToVoiceReq(
          input: result,
          lang: "English",
          gender: "male",
        ),
      );
    } on DioError catch (e) {

    }
    return textToVoice.audio;
  }
}
