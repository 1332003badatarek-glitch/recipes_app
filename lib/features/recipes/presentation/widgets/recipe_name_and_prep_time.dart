import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipesapp/config/themes/app_colors.dart';
import 'package:recipesapp/config/themes/app_fonts.dart';

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
          child: Row(
            children: [
              FaIcon(
                FontAwesomeIcons.alarmClock,
                color: AppColors.primaryColor,
                size: 15,
              ),
              SizedBox(width: 4),
              Text(
                '$prepTime',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFonts.poppines,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
