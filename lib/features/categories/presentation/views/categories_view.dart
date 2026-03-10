import 'package:flutter/material.dart';
import 'package:recipesapp/features/categories/presentation/widgets/categories_view_body.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('Categories'),
      ),
      body: CategoriesViewBody(),
    );
  }
}
