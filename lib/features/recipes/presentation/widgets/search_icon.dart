import 'package:flutter/material.dart';
import 'package:recipesapp/config/routing/app_route_names.dart';
import 'package:recipesapp/config/themes/app_colors.dart';

class SearchIcon extends StatelessWidget {
  final IconData icon;
  const SearchIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        color: AppColors.componentPink,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRouteNames.searchView);
        },
        icon: Icon(icon, size: 20, color: AppColors.secondryColor),
      ),
    );
  }
}
