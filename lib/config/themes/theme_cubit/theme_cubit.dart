import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipesapp/config/themes/theme_local_storage/theme_local_storage.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  
  ThemeCubit() : super(  ThemeMode.light);
  bool isDark = false;

  Future<void> loadTheme() async {
    isDark = await ThemeLocalStorage.loadTheme();
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> toggleTheme() async {
    isDark = !isDark;
    await ThemeLocalStorage.saveTheme(isDark);
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }
}
