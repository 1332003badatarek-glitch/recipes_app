import 'package:flutter/material.dart';
import 'package:recipesapp/core/models/models/recipes_model.dart';
import 'package:recipesapp/features/favorites/presentation/widgets/favorites_grid_view_item.dart';

class FavoritesGridViewBuilder extends StatelessWidget {
  final List<RecipesModel> recipes;
  const FavoritesGridViewBuilder({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 48,
        crossAxisSpacing: 24,
        childAspectRatio: 0.75,
      ),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        return FavoritesGridViewItem(recipe: recipe);
      },
    );
  }
}
