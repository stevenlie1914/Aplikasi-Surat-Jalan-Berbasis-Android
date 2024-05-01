import 'package:flutter/material.dart';

import '../../common/app_style.dart';

class CardShadow extends StatelessWidget {
  final Widget child;
  final double radius;
  final double blurRadius;
  final double dx;
  final double dy;
  final double shadowOpacity;
  final EdgeInsetsGeometry padding;
  const CardShadow({
    super.key,
    required this.child,
    this.radius = 10,
    this.blurRadius = 7,
    this.dx = 0,
    this.dy = 1,
    this.shadowOpacity = 0.25,
    this.padding = const EdgeInsets.all(8),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: AppStyle.whiteColor,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
              blurRadius: blurRadius,
              offset: Offset(
                dx,
                dy,
              ),
              color: AppStyle.blackColor.withOpacity(
                shadowOpacity,
              ),
            ),
          ],
        ),
        child: child);
  }
}
