import 'dart:convert';
import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';

part 'text_to_voice_resp.g.dart';

@JsonSerializable()
class TextToVoiceResp {

  @JsonKey(name: "status")
  late String status;

  @JsonKey(name: "audio", fromJson: _fromJson)
  late Uint8List audio;

  TextToVoiceResp({required this.status, required this.audio});

  static Uint8List _fromJson(String jsonValue) {
    return base64Decode(jsonValue);
  }

  factory TextToVoiceResp.fromJson(Map<String, dynamic> json) =>
      _$TextToVoiceRespFromJson(json);

  Map<String, dynamic> toJson() => _$TextToVoiceRespToJson(this);
}