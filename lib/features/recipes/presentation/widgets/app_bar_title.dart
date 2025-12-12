import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final String userName;

  const AppBarTitle({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hi! $userName', style: TextTheme.of(context).displayLarge),
          Text(
            'What are you cooking today',
            style: TextTheme.of(context).headlineMedium,
          ),
        ],
      ),
    );
  }
}
