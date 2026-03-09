import 'package:dio/dio.dart';
import 'package:recipesapp/core/models/models/recipes_response_model.dart';
import 'package:recipesapp/core/network/api_constants.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';


part 'recipes_by_category_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class RecipesByCategoryApiService {
  
   factory RecipesByCategoryApiService(Dio dio, {String baseUrl}) = _RecipesByCategoryApiService;

  @GET(ApiConstants.recipesByMealType)
  Future<RecipesResponseModel> getRecipesByMealType(
    @Path("type") String type,
  );

}