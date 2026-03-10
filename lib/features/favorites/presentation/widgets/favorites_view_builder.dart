import 'package:flutter/material.dart';
import 'package:recipesapp/core/models/models/recipes_model.dart';
import 'package:recipesapp/core/widgets/custom_grid_view_builder.dart';
import 'package:recipesapp/features/favorites/presentation/widgets/favorites_grid_view_item.dart';

class FavoritwsViewBuilder extends StatelessWidget {
  final List<RecipesModel> recipes;
  const FavoritwsViewBuilder({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return CustomGridViewBuilder(
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        return FavoritesGridViewItem(recipe: recipe, index: index);
      },
    );
  }
}
