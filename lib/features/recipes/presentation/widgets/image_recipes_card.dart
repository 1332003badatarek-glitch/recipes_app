import 'package:flutter/material.dart';

class ImageRecipesCard extends StatelessWidget {
  final String image;
  final double imageHeight;
  const ImageRecipesCard({
    super.key,
    required this.image,
    this.imageHeight = 0.19,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * imageHeight,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
