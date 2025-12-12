// 
part of 'recipes_cubit.dart';

@immutable
abstract class RecipesState {}

class RecipesInitial extends RecipesState {}

class RecipesLoading extends RecipesState {}

class RecipesSuccess extends RecipesState {
  final List<RecipesModel> recipes;
  final LoginResponseModel userData;
  final bool isLoadingMore;
  final bool isLastPage;

  RecipesSuccess({
    required this.recipes,
    required this.userData,
    this.isLoadingMore = false,
    this.isLastPage = false,
  });

  RecipesSuccess copyWith({
    List<RecipesModel>? recipes,
    LoginResponseModel? userData,
    bool? isLoadingMore,
    bool? isLastPage,
  }) {
    return RecipesSuccess(
      recipes: recipes ?? this.recipes,
      userData: userData ?? this.userData,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      isLastPage: isLastPage ?? this.isLastPage,
    );
  }
}

class RecipesFailure extends RecipesState {
  final ApiErrorModel error;
  RecipesFailure({required this.error});
}
