import 'package:flutter/material.dart';
import 'package:recipesapp/features/favorites/presentation/widgets/favorites_grid_view_builder.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key,});

  @override
  Widget build(BuildContext context) {
    return FavoritesGridViewBuilder();
  }
}
