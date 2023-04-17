// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_to_voice_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextToVoiceReq _$TextToVoiceReqFromJson(Map<String, dynamic> json) =>
    TextToVoiceReq(
      input: json['input'] as String,
      lang: json['lang'] as String,
      gender: json['gender'] as String,
      alpha: (json['alpha'] as num?)?.toDouble() ?? 1,
      segmentWise: json['segmentwise'] as String? ?? "True",
    );

Map<String, dynamic> _$TextToVoiceReqToJson(TextToVoiceReq instance) =>
    <String, dynamic>{
      'input': instance.input,
      'lang': instance.lang,
      'gender': instance.gender,
      'alpha': instance.alpha,
      'segmentwise': instance.segmentWise,
    };
