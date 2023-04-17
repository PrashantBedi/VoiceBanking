// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_to_voice_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextToVoiceResp _$TextToVoiceRespFromJson(Map<String, dynamic> json) =>
    TextToVoiceResp(
      status: json['status'] as String,
      audio: TextToVoiceResp._fromJson(json['audio'] as String),
    );

Map<String, dynamic> _$TextToVoiceRespToJson(TextToVoiceResp instance) =>
    <String, dynamic>{
      'status': instance.status,
      'audio': instance.audio,
    };
