import 'dart:convert';

import 'package:recipesapp/config/cache/cache_constants.dart';
import 'package:recipesapp/config/cache/cache_helper.dart';
import 'package:recipesapp/core/models/models/recipes_model.dart';

class FavoritesLocalDataSource {
  Future<void> saveFavoriteRecipe(RecipesModel recipe) async {
    List<String> favorites =
        CacheHelper.getData(
          key: CacheConstants.favoritesList,
        )?.cast<String>() ??
        [];

    bool exists = favorites.any((item) {
      final stored = RecipesModel.fromJson(jsonDecode(item));
      return stored.id == recipe.id;
    });

    if (exists) return;

    // if (favorites.contains(jsonEncode(recipe.toJson()))) return;
    favorites.add(jsonEncode(recipe.toJson()));
    await CacheHelper.saveData(
      key: CacheConstants.favoritesList,
      value: favorites,
    );
  }

  List<RecipesModel> getFavorites() {
    List<String> favorites =
        CacheHelper.getData(
          key: CacheConstants.favoritesList,
        )?.cast<String>() ??
        [];
    // if (favorites.isEmpty) return [];
    return favorites.map((item) {
      return RecipesModel.fromJson(jsonDecode(item));
    }).toList();
  }

  
  Future<void> removeFavoriteRecipe(RecipesModel recipe) async {
    List<String> favorites =
        CacheHelper.getData(key: CacheConstants.favoritesList)
                ?.cast<String>() ??
            [];
    favorites.removeWhere((item) {
      final stored = RecipesModel.fromJson(jsonDecode(item));
      return stored.id == recipe.id;
    });
    await CacheHelper.saveData(
      key: CacheConstants.favoritesList,
      value: favorites,
    );
  }
}
