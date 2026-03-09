import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:recipesapp/config/routing/app_route_names.dart';
import 'package:recipesapp/core/models/models/recipes_model.dart';
import 'package:recipesapp/core/utils/app_functions.dart';
import 'package:recipesapp/features/favorites/presentation/widgets/favorites_grid_view_item_data.dart';

class FavoritesGridViewItem extends StatelessWidget {
  final RecipesModel recipe;

  const FavoritesGridViewItem({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
            decoration: AppFunctions.cardBoxDecoration(boxColor: Colors.white),
            constraints: BoxConstraints(
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
    );
  }
}
