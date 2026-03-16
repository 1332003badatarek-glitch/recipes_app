
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipesapp/config/themes/app_colors.dart';

class InitialMessageSearchView extends StatelessWidget {
  const InitialMessageSearchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "Search for your favorite recipes",
    
            style: TextTheme.of(
              context,
            ).bodyLarge!.copyWith(fontSize: 20),
          ),
        ),
        SizedBox(width: 5),
        Icon(
          FontAwesomeIcons.magnifyingGlass,
          color: AppColors.primaryColor,
        ),
      ],
    );
  }
}