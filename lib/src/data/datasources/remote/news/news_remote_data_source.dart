
import 'package:merphy/src/data/models/news/news_model.dart';

/// Abstract class for remote data source of actor entity.
abstract class NewsRemoteDataSource {
  /// Returns the actor detail model for the given actor id.
  Future<List<NewsModel>> getNews();

  Future<NewsModel> getNewsDetail({required int newsId});

  /// Returns the actor social media model for the given actor id.
  // Future<ActorSocialMediaModel> getActorSocialMedia({required String actorId});
}
