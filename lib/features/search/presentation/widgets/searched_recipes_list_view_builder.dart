
import 'package:flutter/material.dart';
import 'package:recipesapp/core/models/models/recipes_model.dart';
import 'package:recipesapp/features/recipes/presentation/widgets/recipes_card.dart';

class SearchedRecipesListViewBuilder extends StatelessWidget {
  const SearchedRecipesListViewBuilder({
    super.key,
    required this.recipes,
  });

  final List<RecipesModel> recipes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      keyboardDismissBehavior:
          ScrollViewKeyboardDismissBehavior.onDrag,
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 8,
          ),
          child: RecipeCard(recipesModel: recipes[index]),
        );
      },
    );
  }
}