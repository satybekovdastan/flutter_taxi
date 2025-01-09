// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


NewsModel _$NewsModelFromJson(Map<String, dynamic> json) =>
    NewsModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      image: json['image_url'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image_url': instance.image,
      'created_at': instance.createdAt,
    };
