import "package:json_annotation/json_annotation.dart";

part 'text_to_voice_req.g.dart';

@JsonSerializable()
class TextToVoiceReq {
  @JsonKey(name: "input")
  late String input;

  @JsonKey(name: "lang")
  late String lang;

  @JsonKey(name: "gender")
  late String gender;

  @JsonKey(name: "alpha")
  late double alpha;

  @JsonKey(name: "segmentwise")
  late String segmentWise;

  TextToVoiceReq({
    required this.input,
    required this.lang,
    required this.gender,
    this.alpha  = 1,
    this.segmentWise  = "True",
  });

  factory TextToVoiceReq.fromJson(Map<String, dynamic> json) =>
      _$TextToVoiceReqFromJson(json);

  Map<String, dynamic> toJson() => _$TextToVoiceReqToJson(this);
}
