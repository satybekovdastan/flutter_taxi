import 'dart:math';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:merphy/src/data/models/news/news_model.dart';
import 'package:merphy/src/domain/entities/news/news_entity.dart';
import 'package:merphy/src/domain/repositories/news/news_repository.dart';

import '../../../core/exceptions/network/network_exception.dart';
import '../../../utils/logger.dart';
import '../../datasources/export_datasources.dart';
import 'package:logger/logger.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource _actorRemoteDataSource;

  NewsRepositoryImpl(this._actorRemoteDataSource);

  @override
  Future<Either<NetworkException, List<NewsEntity>>> getNews() async {
    try {
      final result = await _actorRemoteDataSource.getNews();
      return Right(result.map((model) => model.toEntity()).toList());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, NewsEntity>> getNewsDetail({required int newsId}) async {
    try {
      final result = await _actorRemoteDataSource.getNewsDetail(newsId: newsId);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }


  // @override
  // Future<Either<NetworkException, ActorSocialMediaEntity>> getActorSocialMedia({required String actorId}) async {
  //   try {
  //     final result = await _actorRemoteDataSource.getActorSocialMedia(actorId: actorId);
  //
  //     return Right(result.toEntity());
  //   } on DioException catch (e) {
  //     return Left(NetworkException.fromDioError(e));
  //   }
  // }
}
