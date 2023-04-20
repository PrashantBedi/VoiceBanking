import 'package:json_annotation/json_annotation.dart';

part 'context_from_audio_resp.g.dart';

@JsonSerializable()
class ContextFromAudioResp {

  @JsonKey(name: "result")
  late String data;

  ContextFromAudioResp(this.data);

  factory ContextFromAudioResp.fromJson(Map<String, dynamic> json) =>
      _$ContextFromAudioRespFromJson(json);

  Map<String, dynamic> toJson() => _$ContextFromAudioRespToJson(this);
}