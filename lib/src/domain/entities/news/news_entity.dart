import 'package:equatable/equatable.dart';

class NewsEntity extends Equatable {
  final int? id;
  final String? title;
  final String? image;
  final String? createdAt;

  const NewsEntity({
    this.id,
    this.title,
    this.image,
    this.createdAt
  });

  @override
  List<Object?> get props {
    return [
      id,
      title,
      image,
      createdAt
    ];
  }

  NewsEntity copyWith({
    int? id,
    String? title,
    String? image,
    String? createdAt,
  }) {
    return NewsEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
    );
  }

}
