import 'package:flutter/material.dart';

class RowLabelWidget extends StatelessWidget {
  final String label;
  final Widget widget;
  const RowLabelWidget({super.key, required this.label, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Flexible(child: widget)
      ],
    );
  }
}
