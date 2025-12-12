import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipesapp/config/themes/app_colors.dart';
import 'package:recipesapp/layout/main_layout/navigation_cubit.dart';

class CustomeBotomNavigationBar extends StatelessWidget {
  const CustomeBotomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 8,
      child: Center(
        //ToDO provide the BlocBuilder
        child: BlocBuilder<NavigationCubit, int>(
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor,
                    blurRadius: 8,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _navIconButton(
                    context,
                    index: 0,
                    solid: FontAwesomeIcons.solidHouse,
                    outlined: FontAwesomeIcons.house,
                  ),

                  _navIconButton(
                    context,
                    index: 1,
                    solid: Icons.layers,
                    outlined: Icons.layers_outlined,
                    size: 35,
                  ),

                  _navIconButton(
                    context,
                    index: 2,
                    solid: FontAwesomeIcons.solidHeart,
                    outlined: FontAwesomeIcons.heart,
                  ),
                  _navIconButton(
                    context,
                    index: 3,
                    solid: FontAwesomeIcons.solidUser,
                    outlined: FontAwesomeIcons.user,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  IconButton _navIconButton(
    BuildContext context, {
    required int index,
    required IconData solid,
    required IconData outlined,
    double? size,
  }) {
    final currentIndex = context.watch<NavigationCubit>().state;
    final iconData = (currentIndex == index) ? solid : outlined;
    // ignore: unused_local_variable
    final isFa =
        // ignore: unnecessary_type_check
        iconData is IconData &&
        (iconData == FontAwesomeIcons.house ||
            iconData == FontAwesomeIcons.solidHeart ||
            iconData == FontAwesomeIcons.heart ||
            iconData == FontAwesomeIcons.solidUser ||
            iconData == FontAwesomeIcons.user);
    return IconButton(
      onPressed: () => context.read<NavigationCubit>().changeTab(index),
      icon: FaIcon(iconData, color: Colors.white, size: size ?? 26),
    );
  }
}
