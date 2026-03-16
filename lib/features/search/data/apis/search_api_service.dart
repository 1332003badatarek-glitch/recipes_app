import 'package:dio/dio.dart';
import 'package:recipesapp/core/models/models/recipes_response_model.dart';
import 'package:recipesapp/core/network/api_constants.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'search_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class SearchApiService {

  factory SearchApiService(Dio dio, {String baseUrl}) = _SearchApiService;

  @GET(ApiConstants.searchRecipes)
  Future<RecipesResponseModel> searchRecipes(
    @Query("q") String query,
  );
}