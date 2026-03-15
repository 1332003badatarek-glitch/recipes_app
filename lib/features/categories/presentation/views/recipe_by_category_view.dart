
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipesapp/core/DI/injection.dart';
import 'package:recipesapp/features/categories/cubit/recipe_by_category_cubit.dart';
import 'package:recipesapp/features/categories/data/models/category_model.dart';
import 'package:recipesapp/features/categories/presentation/widgets/recipe_by_category_view_body.dart';

class RecipeByCategoryView extends StatelessWidget {
  final CategoryModel category;

  const RecipeByCategoryView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return getIt<RecipesByCategoryCubit>()
          ..getRecipesByCategory(category.name);
      },
      child: Scaffold(
        appBar: AppBar(title: Text(category.title)),
        body: const RecipeByCategoryViewBody(),
      ),
    );
  }
}
