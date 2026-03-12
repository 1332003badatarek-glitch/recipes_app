
import 'package:flutter/widgets.dart';
import 'package:recipesapp/core/utils/app_constants.dart';
import 'package:recipesapp/features/categories/data/enums/category_name.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.zero,
          height: MediaQuery.of(context).size.height * 0.21,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(AppConstants.appetizer),

              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(CategoryName.appetizer.name),
      ],
    );
  }
}
