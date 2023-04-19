import 'package:json_annotation/json_annotation.dart';

part 'context_from_audio_req.g.dart';

@JsonSerializable()
class ContextFromAudioReq {


  factory ContextFromAudioReq.fromJson(Map<String, dynamic> json) =>
      _$ContextFromAudioReqFromJson(json);

  Map<String, dynamic> toJson() => _$ContextFromAudioReqToJson(this);

  ContextFromAudioReq();
}