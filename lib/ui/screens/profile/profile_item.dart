import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final String icon;
  final String title;
  final void Function()? onTap;
  const ProfileItem({
    Key? key,
    required this.icon,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10.0,
                ),
                Image.asset(icon),
                const SizedBox(
                  width: 25.0,
                ),
                Text(title),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Divider(
            thickness: 1,
          )
        ],
      ),
    );
  }
}
