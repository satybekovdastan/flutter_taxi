import 'package:fpdart/fpdart.dart';
import 'package:merphy/src/domain/entities/auth/auth_entity.dart';
import 'package:merphy/src/domain/entities/news/news_entity.dart';

import '../../../core/exceptions/network/network_exception.dart';
import '../../repositories/auth/auth_repository.dart';

class AuthUsecases {

  final AuthRepository _authRepository;

  const AuthUsecases(this._authRepository);

  Future<Either<NetworkException, UserEntity>> loginSendCode({required String phone}) async {
    return _authRepository.loginSendCode(phone: phone);
  }

  Future<Either<NetworkException, UserEntity>> verifyCode({required String phone, required String code}) async {
    return _authRepository.verifyCode(phone: phone, code: code);
  }

}
