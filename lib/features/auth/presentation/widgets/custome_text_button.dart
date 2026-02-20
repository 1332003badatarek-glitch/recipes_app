import 'package:flutter/material.dart';
import 'package:recipesapp/config/themes/app_colors.dart';

class CustomeTextButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomeTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: onPressed,
          child: Text(
            textAlign: TextAlign.left,
            text,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
