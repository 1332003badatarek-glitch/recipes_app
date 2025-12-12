// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:recipesapp/core/errors/api_errors/api_error_handler.dart';
import 'package:recipesapp/core/errors/api_errors/api_error_model.dart';
import 'package:recipesapp/core/errors/api_errors/local_status_code.dart';
import 'package:recipesapp/features/recipes/data/api/recipes_api_service.dart';
import 'package:recipesapp/core/models/models/recipes_model.dart';

class RecipesRepo {
  final RecipesApiService recipesApiService;
  RecipesRepo({required this.recipesApiService});

  Future<Either<ApiErrorModel, List<RecipesModel>>> getRecipes({
    required int limit,
    required int skip,
  }) async {
    try {
      final response = await recipesApiService.getRecipes(limit, skip);
      return Right(response.recipes);
    }  on DioException catch (e) {
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
