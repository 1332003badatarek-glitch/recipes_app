
import 'package:flutter/widgets.dart';

class CustomGridViewBuilder extends StatelessWidget {
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;
  const CustomGridViewBuilder({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 48,
        crossAxisSpacing: 24,
        childAspectRatio: 0.75,
      ),
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
