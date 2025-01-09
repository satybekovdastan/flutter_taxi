part of 'verify_cubit.dart';


sealed class VerifyState extends Equatable {
  const VerifyState();

  @override
  List<Object> get props => [];
}

final class VerifyInitial extends VerifyState {}

final class VerifyLoading extends VerifyState {
  const VerifyLoading();
}

final class VerifyLoaded extends VerifyState {
  const VerifyLoaded({required this.item});

  final NewsEntity item;

  @override
  List<Object> get props => [item];
}

final class DidVerify extends VerifyState {
  const DidVerify({required this.item});

  final UserEntity item;

  @override
  List<Object> get props => [item];
}

final class VerifyError extends VerifyState {
  const VerifyError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
