import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipesapp/config/cache/cache_helper.dart';
import 'package:recipesapp/config/routing/app_route_names.dart';
import 'package:recipesapp/config/routing/app_routers.dart';
import 'package:recipesapp/config/themes/theme_cubit/theme_cubit.dart';
import 'package:recipesapp/config/themes/theme_data_dark/dark_theme.dart';
import 'package:recipesapp/config/themes/theme_data_light/light_theme.dart';
import 'package:recipesapp/core/DI/injection.dart';
import 'package:recipesapp/features/auth/data/data_source/local_data_source.dart';
import 'package:recipesapp/features/auth/presentation/views/login_view.dart';
import 'package:recipesapp/features/recipes/cubit/recipes/recipes_cubit.dart';
import 'package:recipesapp/layout/main_layout/main_layout.dart';
import 'package:recipesapp/layout/main_layout/navigation_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  await setupDI();

  final themeCubit = getIt<ThemeCubit>();
  await themeCubit.loadTheme();

  final authLocal = getIt<AuthLocalDataSource>();

  final token = authLocal.accessToken;
  String startScreen;

  if (token != null && token.isNotEmpty) {
    startScreen = AppRouteNames.mainLayout;
  } else {
    startScreen = AppRouteNames.loginView;
  }

  runApp(RecipesApp(startScreen: startScreen, themeCubit: themeCubit));
}

class RecipesApp extends StatelessWidget {
  final ThemeCubit themeCubit;
  final String startScreen;
  const RecipesApp({
    super.key,
    required this.startScreen,
    required this.themeCubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: themeCubit,
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<RecipesCubit>(
                create: (context) => getIt<RecipesCubit>(),
              ),
              BlocProvider(create: (_) => NavigationCubit()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: themeMode,
              onGenerateRoute: AppRouters.generateRoute,
              home: startScreen == AppRouteNames.mainLayout
                  ? const MainLayout()
                  : const LoginView(),
            ),
          );
        },
      ),
    );
  }
}
