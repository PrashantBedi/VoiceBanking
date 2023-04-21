import "dart:convert";
import "dart:io";
import "dart:typed_data";

import "package:backend_integration/dto/context_from_audio_resp.dart";
import "package:backend_integration/dto/metadata.dart";
import "package:backend_integration/dto/text_to_voice_req.dart";
import "package:backend_integration/dto/text_to_voice_resp.dart";
import "package:backend_integration/endpoint/process_audio.dart";
import "package:backend_integration/endpoint/text_to_voice.dart";
import "package:dio/dio.dart";

import "../common/constants.dart";
import "../model/process_audio.dart";


class VoiceProcessRepository {
  late TextToVoiceAPI ttv;
  late ProcessAudioAPI pa;

  VoiceProcessRepository(this.ttv, this.pa);

  Future<ProcessAudio> processVoice(File file, String lang, MetaData md) async {
    var convert = JsonUtf8Encoder().convert(md);
    String e = base64Encode(convert);
    ContextFromAudioResp resp = await pa.getContextFromAudio(Constants.senderId, lang, e, file);
    return ProcessAudio(resp.input, resp.output);
  }

  Future<Uint8List> convertToVoice(String result, String lang) async {
    late TextToVoiceResp textToVoice;
    try {
      textToVoice = await ttv.textToVoice(
        TextToVoiceReq(
          input: result,
          lang: lang,
          gender: Constants.voiceGender,
        ),
      );
    } on DioError catch (_) {

    }
    return textToVoice.audio;
  }
}
