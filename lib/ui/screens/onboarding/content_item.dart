import 'package:flutter/cupertino.dart';

import '../../../common/app_style.dart';

class ContentItem extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  const ContentItem({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppStyle.whiteColor,
          border: Border.all(
            width: 0.0,
            color: AppStyle.whiteColor,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 200,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: AppStyle.redColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
                      child: Text(
                        subtitle,
                        style: const TextStyle(color: AppStyle.greyColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
