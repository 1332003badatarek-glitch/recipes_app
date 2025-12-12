import 'package:flutter/material.dart';
import 'package:recipesapp/config/routing/app_route_names.dart';
import 'package:recipesapp/features/auth/presentation/views/login_view.dart';
import 'package:recipesapp/features/auth/presentation/views/test_view.dart';
import 'package:recipesapp/features/favorites/presentation/views/favorites_view.dart';
import 'package:recipesapp/core/models/models/recipes_model.dart';
import 'package:recipesapp/features/recipes/presentation/views/details_view.dart';
import 'package:recipesapp/features/recipes/presentation/views/home_view.dart';
import 'package:recipesapp/layout/main_layout/main_layout.dart';

class AppRouters {
  AppRouters._();

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRouteNames.loginView:
        return MaterialPageRoute(builder: (_) => LoginView());
      case AppRouteNames.homeView:
        return MaterialPageRoute(builder: (_) => HomeView());
      case AppRouteNames.testView:
        return MaterialPageRoute(builder: (_) => TestView());
      case AppRouteNames.favoritesView:
        return MaterialPageRoute(builder: (_) => FavoritesView());
      case AppRouteNames.detailsView:
        final recipesModel = routeSettings.arguments as RecipesModel;
        return MaterialPageRoute(
          builder: (_) => DetailsView(recipesModel: recipesModel),
        );

      case AppRouteNames.mainLayout:
        return MaterialPageRoute(builder: (_) => MainLayout());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${routeSettings.name}'),
            ),
          ),
        );
    }
  }
}
