import 'dart:io';

import 'package:backend_integration/dto/context_from_audio_resp.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'process_audio.g.dart';

@RestApi(baseUrl: "http://192.168.0.104:8080/")
abstract class ProcessAudioAPI {
  factory ProcessAudioAPI(Dio dio) = _ProcessAudioAPI;

  @POST("v1/context/audio")
  @MultiPart()
  Future<ContextFromAudioResp> getContextFromAudio(
      @Query("senderId") String senderId,
      @Query("sourceLang") String sourceLang,
      @Part() File file,
  );
}
