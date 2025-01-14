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

  Future<void> setNewsText() async {
    emit(GetNewsDetailTextChanged(text: "News Detail Text For Test"));
    if (state is GetNewsDetailLoaded) {
      setNewsTitle("New Title");
    }
  }

  Future<void> setNewsTitle(String newTitle) async {
    final currentState = state;
    logger.e("currentState $currentState");
    if (currentState is GetNewsDetailLoaded) {
      final updatedItem = currentState.item.copyWith(title: newTitle);
      emit(GetNewsDetailLoaded(item: updatedItem));
    }
  }

  final NewsUsecases _newsUsecases;

}
