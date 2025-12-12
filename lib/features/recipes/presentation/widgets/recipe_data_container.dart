import 'package:flutter/material.dart';
import 'package:recipesapp/config/routing/app_route_names.dart';
import 'package:recipesapp/core/utils/app_functions.dart';
import 'package:recipesapp/core/models/models/recipes_model.dart';
import 'package:recipesapp/features/recipes/presentation/widgets/recipe_instructions_and_rating.dart';
import 'package:recipesapp/features/recipes/presentation/widgets/recipe_name_and_prep_time.dart';

class RecipeDataContainer extends StatelessWidget {
  const RecipeDataContainer({super.key, required this.recipesModel});

  final RecipesModel recipesModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AppRouteNames.detailsView,
        arguments: recipesModel),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.250,
          width: MediaQuery.of(context).size.width * 0.88,
          decoration: AppFunctions.cardBoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RecipeNameAndPrepTime(
                  prepTime: recipesModel.prepTimeMinutes,
                  recipeName: recipesModel.name,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.002),
                RecipeInstructionsAndRating(
                  instructions: recipesModel.instructions[0],
                  rating: recipesModel.rating,
                ),
              ],
            ),
          ),
        ),
      
    );
  }

}
