import "dart:convert";
import "dart:io";
import "dart:typed_data";

import "package:backend_integration/dto/context_from_audio_resp.dart";
import "package:backend_integration/dto/metadata.dart";
import "package:backend_integration/dto/text_to_voice_req.dart";
import "package:backend_integration/dto/text_to_voice_resp.dart";
import "package:backend_integration/endpoint/process_audio.dart";
import "package:backend_integration/endpoint/text_to_voice.dart";
import "package:storage/storage.dart";
import "package:dio/dio.dart";


class VoiceProcessRepository {
  late TextToVoiceAPI ttv;
  late ProcessAudioAPI pa;
  late Storage _localStorage;

  VoiceProcessRepository(this.ttv, this.pa);

  Future<ContextFromAudioResp> processVoice(File file, String lang) async {
    MetaData m = MetaData(nickName: "foo");
    var convert = JsonUtf8Encoder().convert(m);
    String e = base64Encode(convert);
    ContextFromAudioResp resp = await pa.getContextFromAudio("foo", lang, e, file);
    return resp;
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
