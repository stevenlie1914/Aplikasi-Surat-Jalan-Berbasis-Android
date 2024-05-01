import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:steven_sales_app/common/app_style.dart';
import 'package:steven_sales_app/ui/screens/dashboard/dashboard_screen.dart';
import 'package:steven_sales_app/ui/screens/notification/notification_screen.dart';
import 'package:steven_sales_app/ui/screens/profile/profile_screen.dart';

class NavigationController extends StatefulWidget {
  const NavigationController({Key? key}) : super(key: key);

  @override
  State<NavigationController> createState() => _NavigationControllerState();
}

class _NavigationControllerState extends State<NavigationController> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 1);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 1);

  int maxCount = 3;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    const NotificationScreen(),
    const DashboardScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              /// Provide NotchBottomBarController
              notchBottomBarController: _controller,
              color: AppStyle.redColor,
              showLabel: false,
              // notchShader: const SweepGradient(
              //   startAngle: 0,
              //   endAngle: pi / 2,
              //   colors: [Colors.red, Colors.green, Colors.orange],
              //   tileMode: TileMode.mirror,
              // ).createShader(Rect.fromCircle(center: Offset.zero, radius: 8.0)),
              notchColor: AppStyle.redColor,

              /// restart app if you change removeMargins
              removeMargins: false,
              bottomBarWidth: 500,
              showShadow: true,
              durationInMilliSeconds: 200,
              bottomBarItems: [
                BottomBarItem(
                  inActiveItem: Image.asset(
                    "assets/icons/ic_notif.png",
                  ),
                  activeItem: Image.asset(
                    "assets/icons/ic_notif_active.png",
                  ),
                  itemLabel: 'notification',
                ),
                BottomBarItem(
                  inActiveItem: Image.asset(
                    "assets/icons/ic_home.png",
                  ),
                  activeItem: Image.asset(
                    "assets/icons/ic_home_active.png",
                  ),
                  itemLabel: 'dashboard',
                ),
                BottomBarItem(
                  inActiveItem: Image.asset(
                    "assets/icons/ic_account.png",
                  ),
                  activeItem: Image.asset(
                    "assets/icons/ic_account_active.png",
                  ),
                  itemLabel: 'profile',
                ),
              ],
              onTap: (index) {
                /// perform action on tab change and to update pages you can update pages without pages
                log('current selected index $index');
                _pageController.jumpToPage(index);
              },
            )
          : null,
    );
  }
}
