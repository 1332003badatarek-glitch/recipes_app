import 'package:flutter/material.dart';
import 'package:recipesapp/core/utils/app_functions.dart';
import 'package:recipesapp/features/favorites/presentation/widgets/favorites_grid_view_item_data.dart';


class FavoritesGridViewItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final double rating;
  final String time;
  final VoidCallback onFavoriteTap;
  final bool isFavorite;

  const FavoritesGridViewItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.rating,
    required this.time,
    required this.onFavoriteTap,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            child: FavoritesGridViewItemData(),
          ),
        ),
        Positioned(
          left: -5,
          right: -5,
          top: -26,
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.19,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/test_image.webp'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
