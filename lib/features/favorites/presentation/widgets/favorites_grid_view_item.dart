import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:recipesapp/config/routing/app_route_names.dart';
import 'package:recipesapp/core/models/models/recipes_model.dart';
import 'package:recipesapp/core/utils/app_functions.dart';
import 'package:recipesapp/features/favorites/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:recipesapp/features/favorites/presentation/widgets/custom_slidable_action.dart';
import 'package:recipesapp/features/favorites/presentation/widgets/favorites_grid_view_item_data.dart';

class FavoritesGridViewItem extends StatelessWidget {
  final RecipesModel recipe;
  final int index;

  const FavoritesGridViewItem({
    super.key,
    required this.recipe,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final isRightItem = index % 2 == 1;

    return Slidable(
      key: ValueKey(recipe.id),

      startActionPane: isRightItem
          ? ActionPane(
              motion: const DrawerMotion(),
              children: [
                CustomeSlidableAction(
                  recipe: recipe,
                  onPressed: (context) {
                    context.read<FavoritesCubit>().removeFavorite(recipe);
                  },
                ),
              ],
            )
          : null,

      endActionPane: !isRightItem
          ? ActionPane(
              motion: const DrawerMotion(),
              children: [
                CustomeSlidableAction(
                  recipe: recipe,
                  onPressed: (context) {
                    context.read<FavoritesCubit>().removeFavorite(recipe);
                  },
                ),
              ],
            )
          : null,

      child: InkWell(
        onTap: () {
          log('taped');
          Navigator.pushNamed(
            context,
            AppRouteNames.detailsView,
            arguments: recipe,
          );
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              decoration: AppFunctions.cardBoxDecoration(
                boxColor: Colors.white,
              ),
              constraints: const BoxConstraints(
                minHeight: double.infinity,
                minWidth: double.infinity,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FavoritesGridViewItemData(
                  instructions: recipe.ingredients[1],
                  name: recipe.name,
                  prepTime: recipe.prepTimeMinutes,
                  rating: recipe.rating,
                ),
              ),
            ),
            Positioned(
              left: -5,
              right: -5,
              top: -36,
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.19,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(recipe.image),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
