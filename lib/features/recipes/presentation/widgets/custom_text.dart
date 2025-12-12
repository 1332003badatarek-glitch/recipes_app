
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String label, data;
  const CustomText({super.key, required this.label, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        width: double.infinity,
        child: RichText(
          softWrap: true,

          text: TextSpan(
            children: [
              TextSpan(
                text: label,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextSpan(
                text: data,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
