import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:merphy/src/domain/entities/news/news_entity.dart';
import 'package:merphy/src/domain/usecases/news/news_usecases.dart';

import '../../../utils/logger.dart';

part 'get_news_state.dart';

class GetNewsCubit extends Cubit<GetNewsState> {
  GetNewsCubit(this._newsUsecases) : super(GetNewsInitial());

  Future<void> getNews() async {
    try {
      emit(const GetNewsLoading());
      final result = await _newsUsecases.getNews();
      result.fold(
        (error) => emit(GetNewsError(message: error.message)),
        (success) => emit(GetNewsLoaded(list: success)),
      );
    } catch (_) {
      rethrow;
    }
  }

  final NewsUsecases _newsUsecases;
}
