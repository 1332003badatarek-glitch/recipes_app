import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipesapp/config/themes/app_colors.dart';
import 'package:recipesapp/features/search/cubit/search/search_cubit.dart';
import 'package:recipesapp/features/search/presentation/widgets/initial_message_search_view.dart';
import 'package:recipesapp/features/search/presentation/widgets/recipes_search_field.dart';
import 'package:recipesapp/features/search/presentation/widgets/searched_recipes_list_view_builder.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: const EdgeInsets.all(16), child: RecipesSearchFIeld()),
        Expanded(
          child: BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is SearchSuccess) {
                final recipes = state.recipes;

                if (recipes.isEmpty) {
                  return const Center(
                    child: Text(
                      "No recipes found",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  );
                }
                return SearchedRecipesListViewBuilder(recipes: recipes);
              }
              if (state is SearchError) {
                return Center(child: Text(state.error.message));
              }
              return InitialMessageSearchView();
            },
          ),
        ),
      ],
    );
  }
}
