import 'dart:convert';

import 'package:recipesapp/config/cache/cache_helper.dart';
import 'package:recipesapp/core/models/models/recipes_model.dart';

class FavoritesLocalDataSource {
  Future<void> saveFavoriteRecipe(RecipesModel recipe) async {
    CacheHelper.saveData(
      key: 'favorite_${recipe.id}',
      value: jsonEncode(recipe.toJson()),
    );
  }
}
