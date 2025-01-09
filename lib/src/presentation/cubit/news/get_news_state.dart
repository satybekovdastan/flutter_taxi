part of 'get_news_cubit.dart';


sealed class GetNewsState extends Equatable {
  const GetNewsState();

  @override
  List<Object> get props => [];
}

final class GetNewsInitial extends GetNewsState {}

final class GetNewsLoading extends GetNewsState {
  const GetNewsLoading();
}

final class GetNewsLoaded extends GetNewsState {
  const GetNewsLoaded({required this.list});

  final List<NewsEntity> list;

  @override
  List<Object> get props => [list];
}

final class GetNewsError extends GetNewsState {
  const GetNewsError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
