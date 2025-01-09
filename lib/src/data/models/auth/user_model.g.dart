// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$NewsModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      phone: json['phone'] as String?,
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      detail: json['detail'] as String?,
      isNew: json['is_new'] as bool?,
    );

Map<String, dynamic> _$NewsModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'phone': instance.phone,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'detail': instance.detail,
      'is_new': instance.isNew,
    };
