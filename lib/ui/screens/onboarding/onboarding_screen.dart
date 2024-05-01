import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import 'package:steven_sales_app/ui/screens/login/login_screen.dart';
import 'package:steven_sales_app/ui/screens/onboarding/content_item.dart';

import '../../../common/app_style.dart';

final onboardingPagesList = [
  const ContentItem(
      image: "assets/images/onboarding1.png",
      title: "Sampurna Group",
      subtitle: "Mulai dari 3 kendaraan di tahun 2012, hingga kini menjadi ratusan"),
  const ContentItem(
      image: "assets/images/onboarding2.png",
      title: "Sampurna Group",
      subtitle: "Mulai dari 3 kendaraan di tahun 2012, hingga kini menjadi ratusan"),
  const ContentItem(
      image: "assets/images/onboarding3.png",
      title: "Sampurna Group",
      subtitle: "Mulai dari 3 kendaraan di tahun 2012, hingga kini menjadi ratusan"),
];

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late int index;
  Widget _skipButton({void Function(int)? setIndex}) {
    return TextButton(
      child: const Text(
        "Skip",
        style: TextStyle(
          color: AppStyle.greyColor,
          fontSize: 16,
        ),
      ),
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
          (route) => false,
        );
      },
    );
  }

  Container _nextButton({void Function(int)? setIndex}) {
    return Container(
      decoration: const BoxDecoration(
        color: AppStyle.redColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: const Icon(
          Icons.arrow_forward_ios,
          color: AppStyle.whiteColor,
        ),
        onPressed: () {
          index = index + 1;
          setIndex!(index);
        },
      ),
    );
  }

  Widget get _loginButton {
    return Container(
      decoration: const BoxDecoration(
        color: AppStyle.redColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: const Icon(
          Icons.login,
          color: AppStyle.whiteColor,
        ),
        onPressed: () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
          (route) => false,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Onboarding(
        swipeableBody: onboardingPagesList,
        startIndex: 0,
        onPageChanges: (_, __, currentIndex, sd) {
          index = currentIndex;
        },
        buildHeader: (context, dragDistance, pagesLength, currentIndex, setIndex, sd) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: AppStyle.whiteColor,
              border: Border.all(
                width: 0.0,
                color: AppStyle.whiteColor,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: kToolbarHeight, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  _skipButton(setIndex: setIndex),
                ],
              ),
            ),
          );
        },
        buildFooter: (context, dragDistance, pagesLength, currentIndex, setIndex, sd) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: AppStyle.whiteColor,
              border: Border.all(
                width: 0.0,
                color: AppStyle.whiteColor,
              ),
            ),
            child: ColoredBox(
              color: AppStyle.whiteColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Row(
                  children: [
                    ...onboardingPagesList.asMap().entries.map((entry) {
                      int index = entry.key;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300), // Durasi animasi
                        height: 20,
                        decoration: BoxDecoration(
                          color: AppStyle.yellowColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: index == currentIndex ? 40 : 20,
                        margin: const EdgeInsets.only(right: 10),
                      );
                    }).toList(),
                    const Spacer(),
                    index != pagesLength - 1 ? _nextButton(setIndex: setIndex) : _loginButton,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
