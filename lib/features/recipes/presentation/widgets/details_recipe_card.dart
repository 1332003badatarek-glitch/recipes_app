import 'package:flutter/material.dart';
import 'package:recipesapp/config/themes/app_colors.dart';
import 'package:recipesapp/config/themes/app_fonts.dart';
import 'package:recipesapp/core/utils/app_functions.dart';
import 'package:recipesapp/core/models/models/recipes_model.dart';
import 'package:recipesapp/features/recipes/presentation/widgets/recipe_rating.dart';

class DetailsRecipeCard extends StatelessWidget {
  const DetailsRecipeCard({super.key, required this.recipesModel});

  final RecipesModel recipesModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.022,
        left: 8,
        right: 8,
      ),
      height: MediaQuery.of(context).size.height * 1 / 3,
      decoration: AppFunctions.cardBoxDecoration().copyWith(
        color: AppColors.primaryColor,
      ),
      child: Align(
        alignment: AlignmentGeometry.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Text(
                recipesModel.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: recipesModel.name.length >= 28 ? 17 : 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppFonts.poppines,
                  color: AppColors.whiteTextColor,
                ),
              ),
            ),
            RecipeRating(
              rating: recipesModel.rating,
              iconColor: AppColors.whiteTextColor,
              textColor: AppColors.brownTowColor,
            ),
          ],
        ),
      ),
    );
  }
}
