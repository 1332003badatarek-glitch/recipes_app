import 'package:flutter/material.dart';
import 'package:recipesapp/features/favorites/presentation/widgets/favorites_grid_view_item.dart';

class FavoritesGridViewBuilder extends StatelessWidget {
  const FavoritesGridViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(30),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 48,
        crossAxisSpacing: 24,
        childAspectRatio: 0.75,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return FavoritesGridViewItem(
          image: 'assets/images/test_image.webp',
          title: 'abdallah',
          description: 'hhhhhhhhhhhhhhhhhhhhhhhh',
          rating: 4.1,
          time: "30min",
          isFavorite: true,
          onFavoriteTap: () {},
        );
      },
    );
  }
}
