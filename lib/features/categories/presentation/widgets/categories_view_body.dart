import 'package:flutter/widgets.dart';
import 'package:recipesapp/core/utils/app_constants.dart';
import 'package:recipesapp/features/categories/presentation/widgets/categories_item.dart';

class CategoriesViewBody extends StatelessWidget {
  const CategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.82,
        ),
        itemCount: AppConstants.categories.length,
        itemBuilder: (context, index) {
          return CategoriesItem(category: AppConstants.categories[index]);
        },
      ),
    );
  }
}
