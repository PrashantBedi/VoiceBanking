// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'context_from_audio_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContextFromAudioResp _$ContextFromAudioRespFromJson(
        Map<String, dynamic> json) =>
    ContextFromAudioResp(
      (json['data'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
    );

Map<String, dynamic> _$ContextFromAudioRespToJson(
        ContextFromAudioResp instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
