import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:merphy/src/data/models/auth/user_model.dart';
import 'package:merphy/src/domain/entities/auth/auth_entity.dart';
import 'package:merphy/src/domain/entities/news/news_entity.dart';
import 'package:merphy/src/domain/usecases/news/news_usecases.dart';

import '../../../domain/usecases/auth/auth_usecases.dart';
import '../../../utils/logger.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authUsecases) : super(AuthInitial());

  Future<void> loginSendCode() async {
    if (phone.isEmpty) {
      emit(const AuthError(message: "Filed is Empty"));
    }
    try {
      emit(const AuthLoading());
      final result = await _authUsecases.loginSendCode(phone: phone);

      result.fold(
        (error) => emit(AuthError(message: error.message)),
        (success) => emit(AuthCodeSent(item: success)),
      );
    } catch (_) {
      rethrow;
    }
  }


  String phone = '';
  String code = '';

  void setPhoneNumber(String v) {
    logger.e("phone: $v");
    phone = v.trim();
  }

  void setCode(String v) {
    logger.e("code: $v");
    code = v.trim();
  }

  final AuthUsecases _authUsecases;
}
