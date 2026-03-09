import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:recipesapp/core/errors/api_errors/api_error_handler.dart';
import 'package:recipesapp/core/errors/api_errors/api_error_model.dart';
import 'package:recipesapp/core/errors/api_errors/local_status_code.dart';
import 'package:recipesapp/core/models/models/recipes_model.dart';
import 'package:recipesapp/core/models/models/recipes_response_model.dart';
import 'package:recipesapp/features/categories/data/api/recipes_by_category_api_service.dart';

class RecipesByCategoryRepo {
  final RecipesByCategoryApiService apiService;

  RecipesByCategoryRepo(this.apiService);

  Future<Either<ApiErrorModel, List<RecipesModel>>> getRecipesByMealType(
    String type,
  ) async {
    try {
      final RecipesResponseModel response =
          await apiService.getRecipesByMealType(type);

      return right(response.recipes);
    } on DioException catch (e) {
      return Left(ApiErrorHandler.handle(e));
    } catch (e)  {
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