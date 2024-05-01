import 'package:flutter/material.dart';
import 'package:steven_sales_app/common/app_style.dart';

class DashboardMenuItem extends StatelessWidget {
  final String image;
  final String title;
  final Color? textColor;
  const DashboardMenuItem({super.key, required this.image, required this.title, this.textColor = AppStyle.blackColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          title,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
