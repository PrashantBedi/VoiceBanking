import "package:backend_integration/dto/text_to_voice_resp.dart";
import "package:dio/dio.dart";
import "package:retrofit/retrofit.dart";

import "../dto/text_to_voice_req.dart";

part 'text_to_voice.g.dart';

@RestApi(baseUrl: "https://asr.iitm.ac.in/")
abstract class TextToVoiceAPI {
  factory TextToVoiceAPI(Dio dio) = _TextToVoiceAPI;

  @POST("ttsv2/tts")
  Future<TextToVoiceResp> textToVoice(
    @Body() TextToVoiceReq req,
  );
}
