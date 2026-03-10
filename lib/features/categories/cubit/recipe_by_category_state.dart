part of 'recipe_by_category_cubit.dart';

abstract class RecipesByCategoryState {}

class RecipesByCategoryInitial extends RecipesByCategoryState {}

class RecipesByCategoryLoading extends RecipesByCategoryState {}

class RecipesByCategorySuccess extends RecipesByCategoryState {
  final List<RecipesModel> recipes;

  RecipesByCategorySuccess(this.recipes);
}

class RecipesByCategoryError extends RecipesByCategoryState {
  final ApiErrorModel error;

  RecipesByCategoryError(this.error);
}