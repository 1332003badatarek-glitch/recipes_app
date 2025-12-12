import 'package:flutter/material.dart';
import 'package:recipesapp/config/themes/app_colors.dart';

class AppFunctions {
  AppFunctions._();
  
 static BoxDecoration cardBoxDecoration() {
    return BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: AppColors.primaryColor,
            style: BorderStyle.solid,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(14),
        );
  }
}
