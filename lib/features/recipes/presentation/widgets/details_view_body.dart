import 'package:flutter/material.dart';
import 'package:recipesapp/config/themes/app_colors.dart';
import 'package:recipesapp/core/models/models/recipes_model.dart';
import 'package:recipesapp/features/recipes/presentation/widgets/custom_text.dart';
import 'package:recipesapp/features/recipes/presentation/widgets/details_recipe_card.dart';
import 'package:recipesapp/features/recipes/presentation/widgets/image_recipes_card.dart';

class DetailsViewBody extends StatelessWidget {
  final RecipesModel recipesModel;
  const DetailsViewBody({super.key, required this.recipesModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Stack(
              children: [
                DetailsRecipeCard(recipesModel: recipesModel),
                ImageRecipesCard(image: recipesModel.image, imageHeight: 0.25),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Divider(color: AppColors.primaryColor),
          ),
          CustomText(
            label: 'Prep Time: ',
            data: recipesModel.prepTimeMinutes.toString(),
          ),
          CustomText(
            label: 'Cook Time: ',
            data: recipesModel.cookTimeMinutes.toString(),
          ),
          CustomText(
            label: 'Meal Type: ',
            data: recipesModel.mealType.join(','),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Divider(color: AppColors.primaryColor),
          ),

          CustomText(
            label: 'Ingredients: ',
            data: recipesModel.ingredients.join(',\n'),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Divider(color: AppColors.primaryColor),
          ),
          CustomText(
            label: 'Instructions: ',
            data: recipesModel.instructions.join('\n'),
          ),
        ],
      ),
    );
  }
}
