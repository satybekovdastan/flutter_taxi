import 'package:fpdart/fpdart.dart';
import 'package:merphy/src/domain/entities/news/news_entity.dart';

import '../../../core/exceptions/network/network_exception.dart';

abstract class NewsRepository {
  /// Retrieves the detailed information of an actor.
  Future<Either<NetworkException, List<NewsEntity>>> getNews();

  Future<Either<NetworkException, NewsEntity>> getNewsDetail({required int newsId});

  /// Retrieves the social media information of an actor.
  // Future<Either<NetworkException, ActorSocialMediaEntity>> getActorSocialMedia({required String actorId});
}
