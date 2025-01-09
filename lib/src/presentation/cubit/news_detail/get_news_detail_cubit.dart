import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:merphy/src/domain/entities/news/news_entity.dart';
import 'package:merphy/src/domain/usecases/news/news_usecases.dart';

import '../../../utils/logger.dart';

part 'get_news_detail_state.dart';

class GetNewsDetailCubit extends Cubit<GetNewsDetailState> {
  GetNewsDetailCubit(this._newsUsecases) : super(GetNewsDetailInitial());

  Future<void> getNewsDetail({required int newsId}) async {
    try {
      emit(const GetNewsDetailLoading());
      final result = await _newsUsecases.getNewsDetail(newsId: newsId);
      result.fold(
        (error) => emit(GetNewsDetailError(message: error.message)),
        (success) => emit(GetNewsDetailLoaded(item: success)),
      );
    } catch (_) {
      rethrow;
    }
  }

  final NewsUsecases _newsUsecases;
}
