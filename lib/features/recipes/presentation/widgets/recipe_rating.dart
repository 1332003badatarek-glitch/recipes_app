import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipesapp/config/themes/app_fonts.dart';

class RecipeRating extends StatelessWidget {
  final Color iconColor;
  final Color textColor;
  const RecipeRating({super.key, required this.rating, required this.iconColor, required this.textColor});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$rating',
          style: TextStyle(
            color: textColor,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontFamily: AppFonts.poppines,
          ),
        ),
        SizedBox(width: 4),
        FaIcon(
          FontAwesomeIcons.solidStar,
          color: iconColor,
          size: 13,
        ),
      ],
    );
  }
}
