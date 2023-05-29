import 'package:json_annotation/json_annotation.dart';

part "metadata.g.dart";

@JsonSerializable()
class MetaData {
  @JsonKey(name: "action")
  late String? action;

  @JsonKey(name: "nick_name")
  late String? nickName;

  @JsonKey(name: "full_name")
  late String? fullName;

  @JsonKey(name: "upi_id")
  late String? upiID;

  @JsonKey(name: "mob_number")
  late String? mobNumber;

  @JsonKey(name: "pin_number")
  late String? pinNumber;

  @JsonKey(name: "user_name")
  late String? userName;

  @JsonKey(name: "date_filter")
  late String? duration;

  MetaData({
    this.nickName,
    this.fullName,
    this.upiID,
    this.mobNumber,
    this.pinNumber,
    this.userName,
    this.duration,
  }){
    action = "";
  }

  MetaData.withAction({
    required this.action,
    this.nickName,
    this.fullName,
    this.upiID,
    this.mobNumber,
    this.pinNumber,
    this.userName,
    this.duration,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) =>
      _$MetaDataFromJson(json);

  Map<String, dynamic> toJson() => _$MetaDataToJson(this);
}
