
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipesapp/config/themes/app_colors.dart';
import 'package:recipesapp/config/themes/app_fonts.dart';

class RecipePrepTime extends StatelessWidget {
  const RecipePrepTime({
    super.key,
    required this.prepTime,
  });

  final int prepTime;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
