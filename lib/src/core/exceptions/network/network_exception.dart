import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../utils/token_manager.dart';
import '../../network/model/error_detail/error_detail_model.dart';
import '../../network/model/error_model.dart';

///
/// This class extends [Equatable] and implements [Exception].
/// It contains a [message] and a [statusCode] property.
/// The [message] property contains the error message and the [statusCode]
/// property contains the HTTP status code of the response.
///
/// This class has a constructor [fromDioError] which takes a [DioException]
/// as a parameter and sets the [statusCode] and [message] properties based on
/// the type of the [DioException].
///
/// This class also overrides the [props] getter from [Equatable] to compare
/// instances of this class based on the [message] and [statusCode] properties.
///
/// Example usage:
/// ```dart
/// try {
///   // some network request
/// } on DioException catch (e) {
///   throw NetworkException.fromDioError(e);
/// }
/// ```
class NetworkException extends Equatable implements Exception {
  late final String message;
  late final int? statusCode;

  NetworkException.fromDioError(DioException dioException) {
    statusCode = dioException.response?.statusCode;

    if (statusCode == 401) {
      SharedPreferencesManager().removeToken();
    }

    switch (dioException.type) {
      case DioExceptionType.cancel:
        message = 'Request to API server was cancelled';
        break;

      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout with API server';
        break;

      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout in connection with API server';
        break;

      case DioExceptionType.sendTimeout:
        message = 'Send timeout in connection with API server';
        break;

      case DioExceptionType.connectionError:
        if (dioException.error.runtimeType == SocketException) {
          message = 'Please check your internet connection';
          break;
        } else {
          message = 'Unexpected error occurred';
          break;
        }

      case DioExceptionType.badCertificate:
        message = 'Bad Certificate';
        break;

      case DioExceptionType.badResponse:
        // final model = NetworkErrorModel.fromJson(dioException.response?.data as Map<String, dynamic>);
        // message = model.statusMessage ?? 'Unexpected bad response';
        try {
          // Пытаемся парсить как NetworkErrorModel
          final data = dioException.response?.data as Map<String, dynamic>;
          if (data.containsKey('detail') && data['detail'] is List) {
            // Если 'detail' содержит список, используем NetworkErrorDetailModel
            final detailModel = NetworkErrorDetailModel.fromJson(data);
            message = detailModel.detail?.first.message ?? 'Detailed error message';
            // message = detailModel.detail?.map((e) => e.message).join(', ') ?? 'Detailed error message';
          } else {
            final model = NetworkErrorModel.fromJson(data);
            message = model.statusMessage ?? 'Unexpected bad response';
          }
        } catch (e) {
          // Обработка случаев, когда формат данных не соответствует ожиданиям
          message = 'Error parsing response: $e';
        }
        break;

      case DioExceptionType.unknown:
        message = 'Unexpected error occurred';
        break;
    }
  }

  @override
  List<Object?> get props => [message, statusCode];
}
