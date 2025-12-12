import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipesapp/core/errors/api_errors/api_error_model.dart';
import 'package:recipesapp/features/auth/data/models/login_response_model.dart';
import 'package:recipesapp/features/auth/data/repo/auth_repo.dart';
import 'package:recipesapp/core/models/models/recipes_model.dart';
import 'package:recipesapp/features/recipes/data/repo/recipes_repo.dart';

part 'recipes_state.dart';

class RecipesCubit extends Cubit<RecipesState> {
  final RecipesRepo recipesRepo;
  final AuthRepo authRepo;

  RecipesCubit(this.recipesRepo, this.authRepo) : super(RecipesInitial());

  final List<RecipesModel> _recipes = [];
  int _skip = 0;
  final int _limit = 10;
  bool _isLastPage = false;
  bool _isLoading = false;

  Future<void> loadRecipes({bool loadMore = false}) async {
    if (_isLoading || _isLastPage) return;
    _isLoading = true;

    final userData = authRepo.getCachedUserData();

    if (!loadMore) {
      emit(RecipesLoading());
    } else {
      if (state is RecipesSuccess) {
        emit((state as RecipesSuccess).copyWith(isLoadingMore: true));
      }
    }
    final result = await recipesRepo.getRecipes(limit: _limit, skip: _skip);
    result.fold(
      (error) {
        emit(RecipesFailure(error: error));
      },
      (newRecipes) {
        if (newRecipes.isEmpty) {
          _isLastPage = true;
        } else {
          _recipes.addAll(newRecipes);
          _skip += _limit;
        }

        emit(
          RecipesSuccess(
            recipes: List.from(_recipes),
            userData: userData!,
            isLoadingMore: false,
            isLastPage: _isLastPage,
          ),
        );
      },
    );

    _isLoading = false;
  }
}
