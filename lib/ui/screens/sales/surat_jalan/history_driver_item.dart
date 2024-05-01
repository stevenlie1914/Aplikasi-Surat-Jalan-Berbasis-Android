import 'package:flutter/material.dart';
import 'package:steven_sales_app/common/app_style.dart';

class HistoryDriverItem extends StatelessWidget {
  const HistoryDriverItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Asep Saepudin",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Alam Sampurna Makmur, PT.\nSuhendra",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            Text(
              "Dump Truck / Engkel",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            Text(
              "Engkel",
              style: TextStyle(
                color: AppStyle.greyColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Text(
          "2230301071",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
