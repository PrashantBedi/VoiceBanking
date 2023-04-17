import 'dart:convert';
import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';

part 'text_to_voice_resp.g.dart';

@JsonSerializable()
class TextToVoiceResp {

  @JsonKey(name: "status")
  late String status;

  @JsonKey(name: "audio", fromJson: _fromJson)
  late String audio;

  TextToVoiceResp({required this.status, required this.audio});

  static String _fromJson(String d) {
    Codec<String, String> stringToBase64 = utf8.fuse<String>(base64);
    return stringToBase64.decode(d);
  }

  factory TextToVoiceResp.fromJson(Map<String, dynamic> json) =>
      _$TextToVoiceRespFromJson(json);

  Map<String, dynamic> toJson() => _$TextToVoiceRespToJson(this);
}