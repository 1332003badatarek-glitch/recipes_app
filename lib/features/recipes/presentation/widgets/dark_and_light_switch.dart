import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:recipesapp/config/themes/app_colors.dart';
import 'package:recipesapp/config/themes/theme_cubit/theme_cubit.dart';

class DarkAndLightSwitch extends StatefulWidget {
  const DarkAndLightSwitch({super.key});

  @override
  State<DarkAndLightSwitch> createState() => _DarkAndLightSwitchState();
}

class _DarkAndLightSwitchState extends State<DarkAndLightSwitch> {
  @override
  Widget build(BuildContext context) {
    bool isDark = context.read<ThemeCubit>().isDark;
    return FlutterSwitch(
      value: isDark,
      duration: Duration(seconds: 1),
      activeIcon: Icon(Icons.dark_mode),
      inactiveIcon: Icon(Icons.light_mode, color: AppColors.whiteTextColor),
      onToggle: (status) {
        setState(() {
          context.read<ThemeCubit>().toggleTheme();
          isDark = status;
        });
      },
      toggleColor: Colors.black,
      toggleSize: 20,
      width: 45,
      height: 25,
      activeColor: AppColors.componentPink,
      inactiveColor: AppColors.componentPink,
      activeToggleColor: AppColors.brownTowColor,
      inactiveToggleColor: AppColors.secondryColor,
    );
  }
}
