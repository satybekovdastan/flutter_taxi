import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:merphy/src/domain/entities/auth/auth_entity.dart';
import '../../../core/exceptions/network/network_exception.dart';
import '../../../domain/repositories/auth/auth_repository.dart';
import '../../../utils/token_manager.dart';
import '../../datasources/remote/auth/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {

  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);

  @override
  Future<Either<NetworkException, UserEntity>> loginSendCode({required String phone}) async {
    try {
      final result = await _authRemoteDataSource.loginSendCode(phone: phone);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  @override
  Future<Either<NetworkException, UserEntity>> verifyCode({required String phone, required String code}) async {
    try {
      final result = await _authRemoteDataSource.verifyCode(phone: phone, code: code);
      // SharedManager.instance.saveAccessToken(result.accessToken);

      // TokenManager().saveAccessToken(result.accessToken);
      SharedPreferencesManager().saveToken(result.accessToken);
      return Right(result.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

}
