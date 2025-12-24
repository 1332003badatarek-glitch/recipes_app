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
    // checking if it's repeated recipe or not

    bool exists = favorites.any((item) {
      final stored = RecipesModel.fromJson(jsonDecode(item));
      return stored.id == recipe.id;
    });

    if (exists) return;

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

  Future<void> removeFavorite(RecipesModel recipe) async {
    List<String> favorites =
        CacheHelper.getData(
          key: CacheConstants.favoritesList,
        )?.cast<String>() ??
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

  bool isFavorite(int recipeId) {
    List<String> favorites =
        CacheHelper.getData(
          key: CacheConstants.favoritesList,
        )?.cast<String>() ??
        [];

    return favorites.any((item) {
      final stored = RecipesModel.fromJson(jsonDecode(item));
      return stored.id == recipeId;
    });
  }

  Future<void> toggleFavorite(RecipesModel recipe) async {
    if (isFavorite(recipe.id)) {
      await removeFavorite(recipe);
    } else {
      await saveFavoriteRecipe(recipe);
    }
  }
}
