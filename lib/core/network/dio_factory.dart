import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:recipesapp/core/network/api_constants.dart';
import 'package:recipesapp/core/session/session_maneger.dart';
import 'package:recipesapp/features/auth/data/data_source/local_data_source.dart';

class DioFactory {
  DioFactory._();

  static Dio createPublicDio() {
    return DioFactory._buildDio();
  }

  static Dio createAuthorizedDio({
    required AuthLocalDataSource authLocalDataSource,
    required SessionManager sessionManager,
  }) {
    final dio = DioFactory._buildDio();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final accessToken = authLocalDataSource.accessToken;
          if (accessToken != null && accessToken.isNotEmpty) {
            options.headers[ApiConstants.authorization] = 'Bearer $accessToken';
            
          }
          handler.next(options);
        },
        onError: (error, handler) async {
          final status = error.response?.statusCode;
          if (status == 401) {
            await authLocalDataSource.clearTokens();
            sessionManager.notifySessionExpired();
          }
          handler.next(error);
        },
      ),
    );
    return dio;
  }

  static Dio _buildDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        contentType: ApiConstants.contentType,
      ),
    );

    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
      ),
    );

    return dio;
  }
}
