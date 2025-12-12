import 'package:dio/dio.dart';
import 'package:recipesapp/core/network/api_constants.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../models/login_response_model.dart' show LoginResponseModel;

part 'login_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class LoginService {
  factory LoginService(Dio dio, {String? baseUrl}) = _LoginService;

  @POST(ApiConstants.login)
  Future<LoginResponseModel> login(@Body() Map<String, dynamic> body);
}
