import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FavoriteIconButton extends StatefulWidget {
  final double iconSize;
  final Color iconColor;
  final Color backgroundColor;
  const FavoriteIconButton({
    super.key,
    required this.iconSize,
    required this.iconColor,
    required this.backgroundColor,
  });

  @override
  State<FavoriteIconButton> createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  bool isFavorite = false;
  IconData icon = FontAwesomeIcons.heart;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Align(
        alignment: AlignmentGeometry.topRight,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.width * 0.10,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {
              isFavorite = !isFavorite;
              if (isFavorite) {
                setState(() {
                  icon = FontAwesomeIcons.solidHeart;
                });
              } else {
                setState(() {
                  icon = FontAwesomeIcons.heart;
                });
              }
            },
            icon: FaIcon(icon, color: widget.iconColor, size: widget.iconSize),
          ),
        ),
      ),
    );
  }
}
