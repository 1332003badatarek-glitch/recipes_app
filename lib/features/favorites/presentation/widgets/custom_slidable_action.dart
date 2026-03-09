import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:recipesapp/config/themes/app_colors.dart';
import 'package:recipesapp/core/models/models/recipes_model.dart';

class CustomeSlidableAction extends StatelessWidget {
  const CustomeSlidableAction({
    super.key,
    required this.recipe,
    required this.onPressed,
  });

  final RecipesModel recipe;
  final void Function(BuildContext) onPressed;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: onPressed,
      backgroundColor: AppColors.primaryColor,
      icon: Icons.delete,
      label: 'Delete',
      borderRadius: BorderRadius.circular(8),
    );
  }
}
