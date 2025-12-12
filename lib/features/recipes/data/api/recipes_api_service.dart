import 'package:dio/dio.dart';
import 'package:recipesapp/core/network/api_constants.dart';
import 'package:recipesapp/core/models/models/recipes_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'recipes_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)

abstract class RecipesApiService {

   factory RecipesApiService(Dio dio, {String baseUrl}) = _RecipesApiService;


     @GET(ApiConstants.recipes)
  Future<RecipesResponseModel> getRecipes(
    @Query(ApiConstants.limit) int limit,
    @Query(ApiConstants.skip) int skip,
  );


} 