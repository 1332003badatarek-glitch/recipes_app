import 'package:flutter/material.dart';
import 'package:recipesapp/features/favorites/presentation/widgets/favorites_view_body.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Favorites'),
      ),

      body: FavoritesViewBody(),
    );
  }
}
