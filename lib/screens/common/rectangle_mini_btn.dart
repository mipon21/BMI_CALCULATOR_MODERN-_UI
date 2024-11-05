
import 'package:flutter/material.dart';

class RectangleMiniButton extends StatelessWidget {
  const RectangleMiniButton({
    super.key,
    required this.icon,
    required this.onTap, this.width = 40, this.height = 40, this.borderRadius = 10,  this.iconSize,
  });

  final IconData icon;
  final VoidCallback onTap;
  final double width;
  final double height;
  final double borderRadius;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(borderRadius),
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Icon(icon, size: iconSize, color: Colors.white,),
      ),
    );
  }
}