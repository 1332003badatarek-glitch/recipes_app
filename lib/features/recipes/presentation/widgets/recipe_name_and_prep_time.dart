import 'package:flutter/material.dart';
import 'package:recipesapp/core/widgets/recipe_prep_time.dart';

class RecipeNameAndPrepTime extends StatelessWidget {
  final String recipeName;
  final int prepTime;
  const RecipeNameAndPrepTime({
    super.key,
    required this.recipeName,
    required this.prepTime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(recipeName, style: TextTheme.of(context).headlineMedium),

        Padding(
          padding: const EdgeInsets.only(right: 2),
          child: RecipePrepTime(prepTime: prepTime),
        ),
      ],
    );
  }
}
