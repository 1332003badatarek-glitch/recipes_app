import 'package:flutter/material.dart';
import 'package:recipesapp/config/themes/app_colors.dart';
import 'package:recipesapp/config/themes/app_fonts.dart';
import 'package:recipesapp/features/recipes/presentation/widgets/recipe_rating.dart';

class RecipeInstructionsAndRating extends StatelessWidget {
  final String instructions;
  final double rating;
  const RecipeInstructionsAndRating({
    super.key,
    required this.instructions,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            instructions,
            style: TextTheme.of(context).headlineMedium!.copyWith(
              fontWeight: FontWeight.w300,
              fontFamily: AppFonts.leagueSpartan,
              // height: 12 / 15,
            ),
          ),
        ),

        RecipeRating(
          rating: rating,
          iconColor: AppColors.primaryColor,
          textColor: AppColors.primaryColor,
        ),
      ],
    );
  }
}
