part of 'favorites_cubit.dart';

@immutable
abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<RecipesModel> favorites;
  final Set<int> favoriteIds;

  FavoritesLoaded({required this.favorites, required this.favoriteIds});
}

class FavoritesFailure extends FavoritesState {
  final FavoritesException error;
  FavoritesFailure({required this.error});
}
