import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipesapp/features/categories/cubit/recipe_by_category_cubit.dart';
import 'package:recipesapp/features/recipes/presentation/widgets/recipes_card.dart';

class RecipeByCategoryViewBody extends StatelessWidget {
  const RecipeByCategoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipesByCategoryCubit, RecipesByCategoryState>(
      builder: (context, state) {
        /// Loading
        if (state is RecipesByCategoryLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        /// Success
        if (state is RecipesByCategorySuccess) {
          final recipes = state.recipes;

          if (recipes.isEmpty) {
            return const Center(child: Text("No recipes found"));
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                child: RecipeCard(recipesModel: recipes[index]),
              );
            },
          );
        }

        /// Error
        if (state is RecipesByCategoryError) {
          return Center(child: Text(state.error.message));
        }

        /// Initial
        return const SizedBox();
      },
    );
  }
}
