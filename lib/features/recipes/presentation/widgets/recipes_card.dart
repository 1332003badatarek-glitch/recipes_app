import 'package:flutter/material.dart';
import 'package:recipesapp/config/themes/app_colors.dart';
import 'package:recipesapp/core/models/models/recipes_model.dart';
import 'package:recipesapp/features/recipes/presentation/widgets/favorite_icon_button.dart';
import 'package:recipesapp/features/recipes/presentation/widgets/image_recipes_card.dart';
import 'package:recipesapp/features/recipes/presentation/widgets/recipe_data_container.dart';

class RecipeCard extends StatelessWidget {
  final RecipesModel recipesModel;
  const RecipeCard({super.key, required this.recipesModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: RecipeDataContainer(recipesModel: recipesModel),
        ),
        ImageRecipesCard(image: recipesModel.image),
        FavoriteIconButton(
          iconSize: 20,
          iconColor: AppColors.secondryColor,
          backgroundColor: AppColors.componentPink,
        ),
      ],
    );
  }
}
