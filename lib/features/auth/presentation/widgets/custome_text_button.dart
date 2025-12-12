
import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: TextButton(
        onPressed: () {},
        child: Text(text, style: Theme.of(context).textTheme.headlineLarge),
      ),
    );
  }
}
