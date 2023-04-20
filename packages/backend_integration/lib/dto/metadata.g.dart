// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaData _$MetaDataFromJson(Map<String, dynamic> json) => MetaData(
      nickName: json['nick_name'] as String?,
      fullName: json['full_name'] as String?,
      upiID: json['upi_id'] as String?,
      mobNumber: json['mob_number'] as String?,
      pinNumber: json['pin_number'] as String?,
      userName: json['user_name'] as String?,
    );

Map<String, dynamic> _$MetaDataToJson(MetaData instance) => <String, dynamic>{
      'nick_name': instance.nickName,
      'full_name': instance.fullName,
      'upi_id': instance.upiID,
      'mob_number': instance.mobNumber,
      'pin_number': instance.pinNumber,
      'user_name': instance.userName,
    };
