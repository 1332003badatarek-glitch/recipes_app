import 'package:dartz/dartz.dart';
import 'package:recipesapp/core/models/models/recipes_model.dart';
import 'package:recipesapp/features/favorites/data/data_source/favorites_local_data_source.dart';
import 'package:recipesapp/features/favorites/errors/favorites_failure.dart';

class FavoritesRepo {
  final FavoritesLocalDataSource local;

  FavoritesRepo({required this.local});

  Future<Either<FavoritesException, List<RecipesModel>>> getFavorites() async {
    try {
      final favorites = local.getFavorites();
      return Right(favorites);
    } catch (_) {
      return const Left(FavoritesException("Failed to load favorites"));
    }
  }

  Future<Either<FavoritesException, void>> toggleFavorite(
    RecipesModel recipe,
  ) async {
    try {
      await local.toggleFavorite(recipe);
      return const Right(null);
    } catch (_) {
      return const Left(FavoritesException("Failed to update favorites"));
    }
  }

  bool isFavorite(int recipeId) {
    try {
      return local.isFavorite(recipeId);
    } catch (_) {
      return false;
    }
  }
}
