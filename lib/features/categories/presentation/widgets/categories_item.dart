import 'package:flutter/material.dart';
import 'package:recipesapp/config/routing/app_route_names.dart';
import 'package:recipesapp/features/categories/data/models/category_model.dart';

class CategoriesItem extends StatelessWidget {
  final CategoryModel category;
  const CategoriesItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        AppRouteNames.recipeByCategoryView,
        arguments: category,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.zero,
            height: MediaQuery.of(context).size.height * 0.21,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(category.image),

                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(category.title, style: TextTheme.of(context).headlineLarge),
        ],
      ),
    );
  }
}
