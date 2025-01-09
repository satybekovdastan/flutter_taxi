// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkErrorDetailModel _$NetworkErrorModelFromJson(Map<String, dynamic> json) {
  return NetworkErrorDetailModel(
    detail: (json['detail'] as List<dynamic>?)
        ?.map((item) => NetworkErrorMessageModel.fromJson(item as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$NetworkErrorModelToJson(NetworkErrorDetailModel instance) {
  return <String, dynamic>{
    'detail': instance.detail?.map((e) => e.toJson()).toList(),
  };
}

