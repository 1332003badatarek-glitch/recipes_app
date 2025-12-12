import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:recipesapp/core/errors/api_errors/api_error_model.dart';
import 'package:recipesapp/core/errors/api_errors/local_status_code.dart';

class ApiErrorHandler {
  ApiErrorHandler._();

  static ApiErrorModel handle(Exception e) {
    if (e is DioException) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(
            message: "Connection timeout with the server",
            statusCode: LocalStatusCode.connectionTimeout,
            icon: Icons.access_time,
          );

        case DioExceptionType.sendTimeout:
          return ApiErrorModel(
            message: "Send timeout while sending data",
            statusCode: LocalStatusCode.sendTimeout,
            icon: Icons.upload,
          );

        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(
            message: "Receive timeout while waiting for data",
            statusCode: LocalStatusCode.receiveTimeout,
            icon: Icons.download,
          );

        case DioExceptionType.badCertificate:
          return ApiErrorModel(
            message: "Invalid or untrusted certificate",
            statusCode: LocalStatusCode.badCertificate,
            icon: Icons.security,
          );

        case DioExceptionType.badResponse:
          return ApiErrorModel(
            message:
                "Bad response from the server: ${e.response?.statusCode ?? ''}",
            statusCode: e.response?.statusCode ?? LocalStatusCode.badResponse,
            icon: Icons.error,
          );

        case DioExceptionType.cancel:
          return ApiErrorModel(
            message: "Request was cancelled",
            statusCode: LocalStatusCode.cancelled,
            icon: Icons.cancel,
          );

        case DioExceptionType.connectionError:
          return ApiErrorModel(
            message: "Connection error, please check your internet",
            statusCode: LocalStatusCode.connectionError,
            icon: Icons.wifi_off,
          );

          

        // case DioExceptionType.unknown:
        default:
          return ApiErrorModel(
            message: "An unknown error occurred",
            statusCode: LocalStatusCode.unknownError,
            icon: Icons.help_outline,
          );
      }
    } else {
      return ApiErrorModel(
        message: "Unexpected error occurred",
        statusCode: LocalStatusCode.unknownError,
        icon: Icons.bug_report,
      );
    }
  }
}
