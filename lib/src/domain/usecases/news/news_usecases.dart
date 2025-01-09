import 'package:fpdart/fpdart.dart';
import 'package:merphy/src/domain/entities/news/news_entity.dart';
import 'package:merphy/src/domain/repositories/news/news_repository.dart';

import '../../../core/exceptions/network/network_exception.dart';

class NewsUsecases {
  final NewsRepository _newsRepository;

  const NewsUsecases(this._newsRepository);

  Future<Either<NetworkException, List<NewsEntity>>> getNews() async {
    return _newsRepository.getNews();
  }

  Future<Either<NetworkException, NewsEntity>> getNewsDetail({required int newsId}) async {
    return _newsRepository.getNewsDetail(newsId: newsId);
  }

}
