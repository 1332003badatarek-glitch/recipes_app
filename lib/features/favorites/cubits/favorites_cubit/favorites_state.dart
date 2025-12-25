part of 'favorites_cubit.dart';

@immutable
abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<RecipesModel> favoritesList;

  FavoritesLoaded({required this.favoritesList});
}

class FavoritesFailure extends FavoritesState {
  final FavoritesException error;

  FavoritesFailure({required this.error});
}

class FavoritesUpdated extends FavoritesState {}
