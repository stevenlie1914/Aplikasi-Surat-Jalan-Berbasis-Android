import 'package:flutter/material.dart';
import 'package:steven_sales_app/common/app_style.dart';

class StepperRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  const StepperRow({super.key, required this.title, required this.subtitle, required this.date});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 12,
                color: AppStyle.greyColor,
              ),
            )
          ],
        ),
        Text(
          date,
          style: const TextStyle(
            fontSize: 12,
            color: AppStyle.greyColor,
          ),
        ),
      ],
    );
  }
}
