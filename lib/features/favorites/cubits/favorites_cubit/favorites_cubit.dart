
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipesapp/core/models/models/recipes_model.dart';
import 'package:recipesapp/features/favorites/data/repo/favorites_repo.dart';
import 'package:recipesapp/features/favorites/errors/favorites_failure.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepo repo;
  FavoritesCubit(this.repo) : super(FavoritesInitial());

  final Set<int> _favoriteIds = {};

  void loadFavorites() async {
    emit(FavoritesLoading());
    final result = await repo.getFavorites();
    result.fold(
      (error) {
        emit(FavoritesFailure(error: error));
      },
      (favorites) {
        final favoritesList = favorites;
        _favoriteIds
          ..clear()
          ..addAll(favorites.map((e) => e.id));
        emit(FavoritesLoaded(favoritesList: favoritesList));
      },
    );
  }

  bool isFavorite(int recipeId) {
    return _favoriteIds.contains(recipeId);
  }

  Future<void> toggleFavorite(RecipesModel recipe) async {
    final result = await repo.toggleFavorite(recipe);
    result.fold(
      (error) {
        emit(FavoritesFailure(error: error));
      },
      (_) {
        if (_favoriteIds.contains(recipe.id)) {
          _favoriteIds.remove(recipe.id);
        } else {
          _favoriteIds.add(recipe.id);
        }
        emit(FavoritesUpdated());
      },
    );
  }
}
