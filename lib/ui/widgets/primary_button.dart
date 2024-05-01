import 'package:flutter/material.dart';
import 'package:steven_sales_app/common/app_style.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final Color? bgColor;
  final Color? textColor;
  final String? icon;
  final Color? iconColor;
  final void Function()? onPressed;
  const PrimaryButton({
    super.key,
    required this.label,
    this.bgColor = AppStyle.redColor,
    this.textColor = AppStyle.whiteColor,
    this.icon,
    this.iconColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(
                icon!,
                color: iconColor,
              ),
            ),
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
