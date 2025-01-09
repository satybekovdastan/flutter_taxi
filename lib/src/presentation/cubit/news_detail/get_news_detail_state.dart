part of 'get_news_detail_cubit.dart';


sealed class GetNewsDetailState extends Equatable {
  const GetNewsDetailState();

  @override
  List<Object> get props => [];
}

final class GetNewsDetailInitial extends GetNewsDetailState {}

final class GetNewsDetailLoading extends GetNewsDetailState {
  const GetNewsDetailLoading();
}

final class GetNewsDetailLoaded extends GetNewsDetailState {
  const GetNewsDetailLoaded({required this.item});

  final NewsEntity item;

  @override
  List<Object> get props => [item];
}

final class GetNewsDetailError extends GetNewsDetailState {
  const GetNewsDetailError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
