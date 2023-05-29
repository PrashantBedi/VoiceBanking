// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'context_from_audio_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContextFromAudioResp _$ContextFromAudioRespFromJson(
        Map<String, dynamic> json) =>
    ContextFromAudioResp(
      json['result'] as String,
      json['input'] as String,
      json['context'] as String,
    );

Map<String, dynamic> _$ContextFromAudioRespToJson(
        ContextFromAudioResp instance) =>
    <String, dynamic>{
      'result': instance.output,
      'input': instance.input,
      'context': instance.action,
    };
