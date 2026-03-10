import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipesapp/features/categories/presentation/views/categories_view.dart';
import 'package:recipesapp/features/favorites/presentation/views/favorites_view.dart';
import 'package:recipesapp/features/recipes/presentation/views/home_view.dart';
import 'package:recipesapp/features/recipes/presentation/widgets/custome_botom_navigation_bar.dart';
import 'package:recipesapp/layout/main_layout/navigation_cubit.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<NavigationCubit, int>(
            builder: (context, currentState) {
              return IndexedStack(
                index: currentState,
                children: [
                  HomeView(),
                  CategoriesView(),
                  FavoritesView(),
                  Container(),
                ],
              );
            },
          ),
          CustomeBotomNavigationBar(),
        ],
      ),
    );
  }
}
