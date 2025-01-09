import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:merphy/src/domain/entities/news/news_entity.dart';

import '../../datasources/_mappers/entity_convertable.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel extends Equatable
    with EntityConvertible<NewsModel, NewsEntity> {
  final int? id;
  final String? title;
  @JsonKey(name: 'image_url')
  final String? image;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  const NewsModel({this.id, this.title, this.image, this.createdAt});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return _$NewsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);

  @override
  List<Object?> get props {
    return [id, title, image, createdAt];
  }

  @override
  NewsEntity toEntity() =>
      NewsEntity(id: id, title: title, image: image, createdAt: createdAt);
}
