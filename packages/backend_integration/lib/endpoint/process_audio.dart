import 'dart:io';

import '../dto/context_from_audio_resp.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'process_audio.g.dart';

@RestApi()
abstract class ProcessAudioAPI {
  factory ProcessAudioAPI(Dio dio) = _ProcessAudioAPI;

  @POST("v1/context/audio")
  @MultiPart()
  Future<ContextFromAudioResp> getContextFromAudio(
      @Query("senderId") String senderId,
      @Query("sourceLang") String sourceLang,
      @Query("metaData") String metadata,
      @Part() File file,
  );
}
