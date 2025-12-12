import 'package:flutter/material.dart';

class CustomeElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String buttonText;
  final Color buttonTextColor;

  const CustomeElevatedButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    required this.buttonTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(
          Size(
            MediaQuery.of(context).size.width * 50 / 100,
            MediaQuery.of(context).size.height * 6 / 100,
          ),
        ),
      ),
      child: Text(
        buttonText,
        style: Theme.of(
          context,
        ).textTheme.titleLarge!.copyWith(color: buttonTextColor),
      ),
    );
  }
}
