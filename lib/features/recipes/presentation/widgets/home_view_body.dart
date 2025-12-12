import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipesapp/features/recipes/cubit/recipes/recipes_cubit.dart';
import 'package:recipesapp/features/recipes/presentation/widgets/recipes_bloc_builder.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      final cubit = context.read<RecipesCubit>();

      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          cubit.state is RecipesSuccess &&
          !(cubit.state as RecipesSuccess).isLoadingMore) {
        cubit.loadRecipes(loadMore: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 12),
      child: RecipesBlocBuilder(scrollController: _scrollController),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
