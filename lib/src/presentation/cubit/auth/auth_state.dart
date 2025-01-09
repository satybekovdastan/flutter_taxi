part of 'auth_cubit.dart';


sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {
  const AuthLoading();
}

final class AuthLoaded extends AuthState {
  const AuthLoaded({required this.item});

  final NewsEntity item;

  @override
  List<Object> get props => [item];
}

final class AuthCodeSent extends AuthState {
  const AuthCodeSent({required this.item});

  final UserEntity item;

  @override
  List<Object> get props => [item];
}

final class AuthError extends AuthState {
  const AuthError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
