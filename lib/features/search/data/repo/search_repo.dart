import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:recipesapp/core/errors/api_errors/api_error_handler.dart';
import 'package:recipesapp/core/errors/api_errors/api_error_model.dart';
import 'package:recipesapp/core/errors/api_errors/local_status_code.dart';
import 'package:recipesapp/core/models/models/recipes_model.dart';
import 'package:recipesapp/features/search/data/apis/search_api_service.dart';

class SearchRepo {
  final SearchApiService searchApiService;

  SearchRepo({required this.searchApiService});

  Future<Either<ApiErrorModel, List<RecipesModel>>> searchRecipes(
    String query,
  ) async {
    try {
      final response = await searchApiService.searchRecipes(query);
      return Right(response.recipes);
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
}
