// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkErrorMessageModel _$NetworkErrorModelFromJson(Map<String, dynamic> json) =>
    NetworkErrorMessageModel(
      type: json['type'] as String?,
      message: json['msg'] as String?,
    );

Map<String, dynamic> _$NetworkErrorModelToJson(NetworkErrorMessageModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'msg': instance.message,
    };
