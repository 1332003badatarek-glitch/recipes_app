import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              return AnimatedSwitcher(
                duration: Duration(seconds: 20),
                transitionBuilder: (child, animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(1, 0),
                      end: Offset(0, 0),
                    ).animate(animation),

                    child: child,
                  );
                },
                child: IndexedStack(
                  index: currentState,
                  children: [
                    HomeView(),
                    Container(),
                    FavoritesView(),
                    Container(),
                  ],
                ),
              );
            },
          ),
          CustomeBotomNavigationBar(),
        ],
      ),
    );
  }
}
