import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipesapp/features/recipes/cubit/recipes/recipes_cubit.dart';
import 'package:recipesapp/features/recipes/presentation/widgets/app_bar_title.dart';
import 'package:recipesapp/features/recipes/presentation/widgets/dark_and_light_switch.dart';
import 'package:recipesapp/features/recipes/presentation/widgets/home_view_body.dart';
import 'package:recipesapp/features/recipes/presentation/widgets/search_icon.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String userData = '';

  @override
  void initState() {
    BlocProvider.of<RecipesCubit>(context).loadRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<RecipesCubit, RecipesState>(
          builder: (context, state) {
            if (state is RecipesSuccess) {
              return AppBarTitle(userName: state.userData.firstName);
            } else {
              return AppBarTitle(userName: 'UserName');
            }
          },
        ),
        actionsPadding: EdgeInsets.only(right: 12),
        actions: [
          DarkAndLightSwitch(),
          SizedBox(width: 8),
          SearchIcon(icon: FontAwesomeIcons.magnifyingGlass),
        ],
      ),

      body: HomeViewBody(),
    );
  }
}
