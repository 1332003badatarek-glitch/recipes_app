import 'package:recipesapp/features/categories/data/enums/category_name.dart';

class CategoryModel {
  final String title;
  final String image;
  final CategoryName name;

  CategoryModel({required this.title, required this.image,required this.name});
}
