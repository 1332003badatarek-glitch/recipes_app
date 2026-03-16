
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipesapp/config/themes/app_colors.dart';
import 'package:recipesapp/features/search/cubit/search/search_cubit.dart';

class RecipesSearchFIeld extends StatelessWidget {
  const RecipesSearchFIeld({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.primaryColor,
      keyboardType: TextInputType.text,
      selectAllOnFocus: true,
      style: TextTheme.of(
        context,
      ).bodyLarge!.copyWith(color: AppColors.brownTowColor),
    
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.componentPink,
        hoverColor: AppColors.secondryColor,
        hintText: "Search recipes...",
      ),
      onChanged: (value) {
        context.read<SearchCubit>().search(value);
      },
    );
  }
}
