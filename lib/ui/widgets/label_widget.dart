import 'package:flutter/material.dart';

class LabelWidget extends StatelessWidget {
  final String label;
  final Color bgColor;
  final Color textColor;
  final double radius;
  const LabelWidget({
    super.key,
    required this.label,
    required this.bgColor,
    required this.textColor,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius), color: bgColor),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 9),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
