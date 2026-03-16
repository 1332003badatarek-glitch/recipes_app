part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<RecipesModel> recipes;

  SearchSuccess(this.recipes);
}
class SearchError extends SearchState {
  final ApiErrorModel error;

  SearchError(this.error);
}
