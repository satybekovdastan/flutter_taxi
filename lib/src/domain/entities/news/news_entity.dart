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

}
