import 'package:json_annotation/json_annotation.dart';

part 'context_from_audio_resp.g.dart';

@JsonSerializable()
class ContextFromAudioResp {

  @JsonKey(name: "result")
  late String output;

  @JsonKey(name: "input")
  late String input;

  @JsonKey(name: "context")
  late String action;

  ContextFromAudioResp(this.output, this.input, this.action);

  factory ContextFromAudioResp.fromJson(Map<String, dynamic> json) =>
      _$ContextFromAudioRespFromJson(json);

  Map<String, dynamic> toJson() => _$ContextFromAudioRespToJson(this);
}