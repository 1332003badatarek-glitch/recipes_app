
import 'package:flutter/material.dart';
import 'package:recipesapp/config/themes/app_colors.dart';
import 'package:recipesapp/config/themes/app_fonts.dart';
import 'package:recipesapp/config/themes/app_text_styles.dart';
import 'package:recipesapp/core/widgets/recipe_prep_time.dart';
import 'package:recipesapp/core/widgets/recipe_rating.dart';

class FavoritesGridViewItemData extends StatelessWidget {
  const FavoritesGridViewItemData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
    
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Text(
            'Beans Burger',
            style: AppTextStyles.baseSubText.copyWith(
              color: AppColors.brownTowColor,
              fontSize: 12,
            ),
          ),
        ),
        Text(
          'Cheesy broccoli-filled lasagna layersCheesy ',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 13,
            fontFamily: AppFonts.leagueSpartan,
            fontWeight: FontWeight.w300,
            height: 13 / 15,
            color: AppColors.brownTowColor,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RecipeRating(
              rating: 4,
              iconColor: AppColors.primaryColor,
              textColor: AppColors.primaryColor,
            ),
            RecipePrepTime(prepTime: 30),
          ],
        ),
      ],
    );
  }
}
