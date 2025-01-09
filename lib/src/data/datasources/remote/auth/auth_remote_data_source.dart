import '../../../models/auth/user_model.dart';

/// Abstract class for remote data source of actor entity.
abstract class AuthRemoteDataSource {

  Future<UserModel> loginSendCode({required String phone});

  Future<UserModel> verifyCode({required String phone, required String code});

}
