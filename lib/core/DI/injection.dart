import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:recipesapp/config/themes/theme_cubit/theme_cubit.dart';
import 'package:recipesapp/core/network/api_constants.dart';
import 'package:recipesapp/core/network/dio_factory.dart';
import 'package:recipesapp/core/session/session_maneger.dart';
import 'package:recipesapp/features/auth/cubits/login_cubit/login_cubit.dart';
import 'package:recipesapp/features/auth/data/api/login_api_service.dart';
import 'package:recipesapp/features/auth/data/data_source/local_data_source.dart';
import 'package:recipesapp/features/auth/data/repo/login_repo.dart';
import 'package:recipesapp/features/categories/cubit/recipe_by_category_cubit.dart';
import 'package:recipesapp/features/categories/data/api/recipes_by_category_api_service.dart';
import 'package:recipesapp/features/categories/data/repo/recipes_by_category_repo.dart';
import 'package:recipesapp/features/favorites/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:recipesapp/features/favorites/data/data_source/favorites_local_data_source.dart';
import 'package:recipesapp/features/favorites/data/repo/favorites_repo.dart';
import 'package:recipesapp/features/recipes/cubit/recipes/recipes_cubit.dart';
import 'package:recipesapp/features/recipes/data/api/recipes_api_service.dart';
import 'package:recipesapp/features/recipes/data/repo/recipes_repo.dart';
import 'package:recipesapp/features/search/cubit/search/search_cubit.dart';
import 'package:recipesapp/features/search/data/apis/search_api_service.dart';
import 'package:recipesapp/features/search/data/repo/search_repo.dart';

final getIt = GetIt.instance;

Future<void> setupDI() async {
  final authLocalDataSource = AuthLocalDataSource();
  getIt.registerSingleton<AuthLocalDataSource>(authLocalDataSource);

  await authLocalDataSource.init();

  getIt.registerLazySingleton<SessionManager>(() => SessionManager());

  getIt.registerLazySingleton<Dio>(
    () => DioFactory.createPublicDio(),
    instanceName: ApiConstants.dioPublic,
  );

  getIt.registerLazySingleton<Dio>(
    () => DioFactory.createAuthorizedDio(
      authLocalDataSource: getIt<AuthLocalDataSource>(),
      sessionManager: getIt<SessionManager>(),
    ),
    instanceName: ApiConstants.dioAuthorized,
  );

  //theme

  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit());

  //auth feature

  getIt.registerLazySingleton<LoginService>(
    () => LoginService(getIt<Dio>(instanceName: ApiConstants.dioPublic)),
  );
  getIt.registerLazySingleton(
    () => LoginRepo(
      loginService: getIt<LoginService>(),
      authLocalDataSource: getIt<AuthLocalDataSource>(),
    ),
  );
  getIt.registerLazySingleton(() => LoginCubit(getIt<LoginRepo>()));

  //recipes feature

  getIt.registerLazySingleton<RecipesApiService>(
    () => RecipesApiService(getIt<Dio>(instanceName: ApiConstants.dioPublic)),
  );

  getIt.registerLazySingleton<RecipesRepo>(
    () => RecipesRepo(recipesApiService: getIt<RecipesApiService>()),
  );

  getIt.registerFactory<RecipesCubit>(
    () => RecipesCubit(getIt<RecipesRepo>(), getIt<LoginRepo>()),
  );

  //favorites feature

  getIt.registerSingleton<FavoritesLocalDataSource>(FavoritesLocalDataSource());
  getIt.registerLazySingleton<FavoritesRepo>(
    () => FavoritesRepo(local: getIt<FavoritesLocalDataSource>()),
  );
  getIt.registerLazySingleton<FavoritesCubit>(
    () => FavoritesCubit(getIt<FavoritesRepo>()),
  );

  // categoris feature

  getIt.registerLazySingleton<RecipesByCategoryApiService>(
    () => RecipesByCategoryApiService(
      getIt<Dio>(instanceName: ApiConstants.dioPublic),
    ),
  );

  getIt.registerLazySingleton<RecipesByCategoryRepo>(
    () => RecipesByCategoryRepo(getIt<RecipesByCategoryApiService>()),
  );
  getIt.registerFactory<RecipesByCategoryCubit>(
  () => RecipesByCategoryCubit(getIt()),
);

//serach feature

getIt.registerLazySingleton<SearchApiService>(
  () => SearchApiService(
    getIt<Dio>(instanceName: ApiConstants.dioPublic),
  ),
);

getIt.registerLazySingleton<SearchRepo>(
  () => SearchRepo(
    searchApiService: getIt<SearchApiService>(),
  ),
);

getIt.registerFactory<SearchCubit>(
  () => SearchCubit(
    getIt<SearchRepo>(),
  ),
);
}


//https://chatgpt.com/share/69b5e595-dc4c-8011-802e-9fced2e1daf8