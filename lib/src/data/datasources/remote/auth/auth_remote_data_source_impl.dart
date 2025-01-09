import 'package:merphy/src/data/models/auth/user_model.dart';

import '../../../../core/constants/url_constants.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../utils/logger.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient _dioClient;

  const AuthRemoteDataSourceImpl(this._dioClient);

  @override
  Future<UserModel> loginSendCode({required String phone}) async {
    try {
      final response = await _dioClient.post(UrlConstants.loginSendCode, data: UserModel(phone: phone));

      final model = UserModel.fromJson(response.data as Map<String, dynamic>);
      return model;

    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserModel> verifyCode({required String phone, required String code}) async {
    try {
      var fcmToken = "e1rro6M8OkVxsEqRQDPefb:APA91bHiq2LgUbG-XvJe575ByGrxP06O3W1gxOd4X0gqN1khZ3m-XXePfoyOnr8O_w67ThzZI-CmUjlDAv8BrssWHeOpqyU37nq_E34NSb8VHtfZG-cXqrjXxIBa6o6D5diCYBpbCcbG";

      var data = {
        'phone': phone,
        'code': code,
        'fcm_token': fcmToken,
        'device': "ios",
        'device_id': "12434345",
        'device_model': "Android Seven",
        'device_version': "10.0",
        'app_version': "1.0.0"
      };

      final response = await _dioClient.post(UrlConstants.verifyCode, data: data);

      final model = UserModel.fromJson(response.data as Map<String, dynamic>);
      return model;

    } catch (_) {
      rethrow;
    }
  }

}
