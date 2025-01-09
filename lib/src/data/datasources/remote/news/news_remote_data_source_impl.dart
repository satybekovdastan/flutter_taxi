import 'package:merphy/src/data/datasources/remote/news/news_remote_data_source.dart';
import 'package:merphy/src/data/models/export_models.dart';
import 'package:merphy/src/utils/logger.dart';

import '../../../../core/constants/url_constants.dart';
import '../../../../core/network/dio_client.dart';

class NewsRemoteDataSourceImpl implements   NewsRemoteDataSource {
  final DioClient _dioClient;

  const NewsRemoteDataSourceImpl(this._dioClient);

  /// Retrieves the details of the actor with the given [actorId] from the remote data source.
  @override
  Future<List<NewsModel>> getNews() async {
    try {
      final response = await _dioClient.get(UrlConstants.news);

      // Ожидаем, что response.data - это массив
      final List<dynamic> jsonList = response.data as List<dynamic>;

      // Преобразуем массив JSON в список моделей
      final List<NewsModel> models = jsonList.map((json) {
        return NewsModel.fromJson(json as Map<String, dynamic>);
      }).toList();

      return models;

    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<NewsModel> getNewsDetail({required int newsId}) async {
    try {

      final response = await _dioClient.get(UrlConstants.newsDetail.replaceAll('{news_id}', newsId.toString()));

      final model = NewsModel.fromJson(response.data as Map<String, dynamic>);

      return model;

    } catch (_) {
      rethrow;
    }
  }

  /// Retrieves the social media accounts of the actor with the given [actorId] from the remote data source.
  // @override
  // Future<ActorSocialMediaModel> getActorSocialMedia({required String actorId}) async {
  //   try {
  //     final response = await _dioClient.get(UrlConstants.actorSocialMedia.replaceAll('{person_id}', actorId));
  //
  //     final model = ActorSocialMediaModel.fromJson(response.data as Map<String, dynamic>);
  //
  //     return model;
  //   } catch (_) {
  //     rethrow;
  //   }
  // }
}
