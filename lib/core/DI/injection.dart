import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:recipesapp/config/themes/theme_cubit/theme_cubit.dart';
import 'package:recipesapp/core/network/api_constants.dart';
import 'package:recipesapp/core/network/dio_factory.dart';
import 'package:recipesapp/core/session/session_maneger.dart';
import 'package:recipesapp/features/auth/cubits/login_cubit/login_cubit.dart';
import 'package:recipesapp/features/auth/data/api/login_api_service.dart';
import 'package:recipesapp/features/auth/data/data_source/local_data_source.dart';
import 'package:recipesapp/features/auth/data/repo/auth_repo.dart';
import 'package:recipesapp/features/recipes/cubit/recipes/recipes_cubit.dart';
import 'package:recipesapp/features/recipes/data/api/recipes_api_service.dart';
import 'package:recipesapp/features/recipes/data/repo/recipes_repo.dart';

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
    () => AuthRepo(
      loginService: getIt<LoginService>(),
      authLocalDataSource: getIt<AuthLocalDataSource>(),
    ),
  );
  getIt.registerLazySingleton(() => LoginCubit(getIt<AuthRepo>()));

  //recipes feature

  getIt.registerLazySingleton<RecipesApiService>(
    () => RecipesApiService(getIt<Dio>(instanceName: ApiConstants.dioPublic)),
  );

  getIt.registerLazySingleton<RecipesRepo>(
    () => RecipesRepo(recipesApiService: getIt<RecipesApiService>()),
  );

  getIt.registerFactory<RecipesCubit>(
    () => RecipesCubit(getIt<RecipesRepo>(), getIt<AuthRepo>()),
  );
}
