import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipesapp/config/themes/app_colors.dart';
import 'package:recipesapp/features/favorites/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:recipesapp/features/favorites/presentation/widgets/favorites_grid_view_builder.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is FavoritesLoaded) {
          if (state.favorites.isEmpty) {
            return const Center(
              child: Text(
                'No favorites yet',
                style: TextStyle(color: AppColors.primaryColor, fontSize: 40),
              ),
            );
          }

          return FavoritesGridViewBuilder(recipes: state.favorites);
        }
        if (state is FavoritesFailure) {
          return Center(child: Text(state.error.message));
        }
        return const Text(
          'Unknowen error please try again later',
          style: TextStyle(color: AppColors.primaryColor, fontSize: 40),
        );
      },
    );
  }
}

// return FavoritesGridViewBuilder();
