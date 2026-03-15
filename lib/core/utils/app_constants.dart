import 'package:recipesapp/features/categories/data/enums/category_name.dart';
import 'package:recipesapp/features/categories/data/models/category_model.dart';

class AppConstants {
  AppConstants._();

  static String appetizer = 'assets/images/appetizer.jpg';
  static String breakfast = 'assets/images/breakfast.png';
  static String dessert = 'assets/images/dessert.png';
  static String dinner = 'assets/images/dinner.png';
  static String snack = 'assets/images/snack.jpg';
  static String lunch = 'assets/images/lunch.png';

  static final List<CategoryModel> categories = [
    CategoryModel(title: "Appetizer", image: AppConstants.appetizer,name: CategoryName.appetizer),
    CategoryModel(title: "Breakfast", image: AppConstants.breakfast,name: CategoryName.breakfast),
    CategoryModel(title: "Lunch", image: AppConstants.lunch,name: CategoryName.lunch),
    CategoryModel(title: "Dinner", image: AppConstants.dinner,name: CategoryName.dinner),
    CategoryModel(title: "Snack", image: AppConstants.snack,name: CategoryName.snack),
    CategoryModel(title: "Dessert", image: AppConstants.dessert,name: CategoryName.dessert),
  ];
}



//https://chatgpt.com/share/69b33299-e298-8011-8015-08ba14c8f57e