
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipesapp/core/errors/api_errors/api_error_model.dart';
import 'package:recipesapp/core/models/models/recipes_model.dart';
import 'package:recipesapp/features/categories/data/enums/category_name.dart';
import 'package:recipesapp/features/categories/data/repo/recipes_by_category_repo.dart';

part 'recipe_by_category_state.dart';

class RecipesByCategoryCubit extends Cubit<RecipesByCategoryState> {
  final RecipesByCategoryRepo repo;

  RecipesByCategoryCubit(this.repo) : super(RecipesByCategoryInitial());

  Future<void> getRecipesByCategory(CategoryName categoryName) async {
    emit(RecipesByCategoryLoading());

    final result = await repo.getRecipesByMealType(categoryName);

    result.fold(
      (error) {
        emit(RecipesByCategoryError(error));
      },
      (recipes) {
        emit(RecipesByCategorySuccess(recipes));
      },
    );
  }
}