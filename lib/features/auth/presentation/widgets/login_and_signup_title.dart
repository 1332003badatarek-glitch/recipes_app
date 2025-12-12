import 'package:flutter/material.dart';

class LoginAndSignUpTitle extends StatelessWidget {
  final String title;
  const LoginAndSignUpTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 10 / 100,
            bottom: MediaQuery.of(context).size.height * 4 / 100,
          ),
          child: Text(title, style: Theme.of(context).textTheme.titleLarge),
        ),
      ],
    );
  }
}
