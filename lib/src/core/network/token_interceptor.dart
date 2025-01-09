import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../utils/logger.dart';
import '../../utils/token_manager.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final sharedPreferences = GetIt.instance<SharedPreferencesManager>();
    final token = sharedPreferences.getToken();
    logger.e("Bearer: $token");

    options.headers = {
      HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
      HttpHeaders.authorizationHeader: 'Bearer $token',
    };

    super.onRequest(options, handler);
  }
}