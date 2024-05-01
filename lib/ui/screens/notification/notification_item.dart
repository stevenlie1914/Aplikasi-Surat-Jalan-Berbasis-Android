import 'package:flutter/material.dart';
import 'package:steven_sales_app/common/app_style.dart';

class NotificatonItem extends StatelessWidget {
  final String title;
  final String content;
  final String date;
  const NotificatonItem({
    super.key,
    required this.title,
    required this.content,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: const BoxDecoration(
        color: AppStyle.lightYellowColor,
        // border: Border(
        //   bottom: BorderSide(
        //     color: AppStyle.lightGreyColor,
        //     width: 2,
        //   ),
        // ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/icons/ic_clock.png",
          ),
          const SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: AppStyle.greyColor, fontSize: 12),
              ),
              Text(content),
            ],
          ),
          const Spacer(),
          Text(date),
        ],
      ),
    );
  }
}
