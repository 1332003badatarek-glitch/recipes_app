import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipesapp/config/themes/app_colors.dart';
import 'package:recipesapp/core/models/models/recipes_model.dart';
import 'package:recipesapp/features/recipes/presentation/widgets/details_view_body.dart';
import 'package:recipesapp/features/recipes/presentation/widgets/favorite_icon_button.dart';

class DetailsView extends StatelessWidget {
  final RecipesModel recipesModel;
  const DetailsView({super.key, required this.recipesModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.arrowLeft, color: AppColors.primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          'Trending Recipes',
          style: TextTheme.of(context).titleLarge,
        ),
        actionsPadding: EdgeInsets.only(right: 12, top: 6),
        actions: [
          FavoriteIconButton(
            iconSize: 20,
            iconColor: AppColors.whiteTextColor,
            backgroundColor: AppColors.primaryColor,
          ),
        ],
        centerTitle: true,
      ),
      body: DetailsViewBody(recipesModel: recipesModel),
    );
  }
}
