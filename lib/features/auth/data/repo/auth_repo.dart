import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:recipesapp/core/errors/api_errors/api_error_handler.dart';
import 'package:recipesapp/core/errors/api_errors/api_error_model.dart';
import 'package:recipesapp/core/errors/api_errors/local_status_code.dart';
import 'package:recipesapp/core/network/api_constants.dart';
import 'package:recipesapp/features/auth/data/api/login_api_service.dart';
import 'package:recipesapp/features/auth/data/data_source/local_data_source.dart';
import 'package:recipesapp/features/auth/data/models/login_response_model.dart';

class AuthRepo {
  final LoginService _loginService;
  final AuthLocalDataSource _authLocalDataSource;
  AuthRepo({
    required LoginService loginService,
    required AuthLocalDataSource authLocalDataSource,
  }) : _loginService = loginService,
       _authLocalDataSource = authLocalDataSource;

  Future<Either<ApiErrorModel, LoginResponseModel>> login(
    String userName,
    String password,
  ) async {
    try {
      final response = await _loginService.login({
        ApiConstants.userName: userName,
        ApiConstants.password: password,
      });

      _authLocalDataSource.saveTokens(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
      );
      _authLocalDataSource.saveUserData(response);

      return Right(response);
    } on DioException catch (e) {
      return Left(ApiErrorHandler.handle(e));
    } catch (e) {
      return Left(
        ApiErrorModel(
          message: e.toString(),
          statusCode: LocalStatusCode.unknownError,
          icon: Icons.warning,
        ),
      );
    }
  }
  LoginResponseModel? getCachedUserData() {
    return _authLocalDataSource.getUserData();
  }
}
