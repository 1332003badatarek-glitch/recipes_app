import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipesapp/features/recipes/cubit/recipes/recipes_cubit.dart';
import 'package:recipesapp/features/recipes/presentation/widgets/recipes_card.dart';

class RecipesBlocBuilder extends StatelessWidget {
  const RecipesBlocBuilder({
    super.key,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipesCubit, RecipesState>(
      builder: (context, state) {
        if (state is RecipesLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is RecipesFailure) {
          return Center(child: Text(state.error.message));
        }

        if (state is RecipesSuccess) {
          final recipes = state.recipes;

          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Trending Recipes',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              ),

              // 🔥 قائمة الريسيبيز
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  // int length =  recipes.length;
                  return Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: RecipeCard(recipesModel: state.recipes[index]),
                  );
                }, childCount: recipes.length),
              ),

              // 🔥 اللودينج بتاع الـ Load More
              if (state.isLoadingMore)
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
