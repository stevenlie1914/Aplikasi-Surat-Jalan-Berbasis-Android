// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:steven_sales_app/common/app_style.dart';
import 'package:steven_sales_app/ui/screens/about_us/about_us_screen.dart';
import 'package:steven_sales_app/ui/screens/change_password/change_password_screen.dart';
import 'package:steven_sales_app/ui/screens/login/login_screen.dart';
import 'package:steven_sales_app/ui/screens/profile/profile_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void logoutDialog() {
      AwesomeDialog(
        context: context,
        isDense: true,
        dialogType: DialogType.info,
        width: MediaQuery.of(context).size.width - 50,
        buttonsBorderRadius: const BorderRadius.all(
          Radius.circular(2),
        ),
        dismissOnTouchOutside: true,
        dismissOnBackKeyPress: false,
        onDismissCallback: (type) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Dismissed by $type'),
            ),
          );
        },
        customHeader: const CircleAvatar(
          radius: 40,
          backgroundColor: AppStyle.blueColor,
          child: Text(
            "!",
            style: TextStyle(fontSize: 40, color: AppStyle.whiteColor),
          ),
        ),
        headerAnimationLoop: false,
        animType: AnimType.bottomSlide,
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 20,
        ),
        title: 'Confirm Logout',
        btnOk: ElevatedButton(
            onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
                (route) => false),
            child: const Text("OK")),
        btnCancel: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(backgroundColor: AppStyle.greenColor),
            child: const Text("Cancel")),
        showCloseIcon: false,
      ).show();
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          actions: [
            IconButton(
              onPressed: () => logoutDialog(),
              icon: Image.asset("assets/icons/ic_logout.png"),
            )
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 30,
          ),
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        100,
                      ),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/img_profile.png"),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          offset: const Offset(2, 6),
                          color: AppStyle.blackColor.withOpacity(0.25),
                        ),
                      ]),
                  height: 90,
                  width: 90,
                ),
                const SizedBox(
                  width: 45.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      "Darobi Wijaya",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppStyle.redColor,
                      ),
                      child: const Text(
                        "PT. Sampurna Group",
                        style: TextStyle(
                          color: AppStyle.whiteColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      "Accounting | Senior Manager",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "Informasi Pribadi",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const ProfileItem(icon: "assets/icons/ic_email.png", title: "dorabiwijaya@gmail.com"),
            const ProfileItem(icon: "assets/icons/ic_phone.png", title: "0858-1545-5565"),
            const ProfileItem(icon: "assets/icons/ic_location.png", title: "Jln. Manga Dua Raya No 20"),
            const SizedBox(
              height: 25.0,
            ),
            const Text(
              "Pengaturan",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ProfileItem(
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChangePasswordScreen(),
                      ),
                    ),
                icon: "assets/icons/ic_setting.png",
                title: "Ganti Sandi"),
            ProfileItem(
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AboutUsScreen(),
                      ),
                    ),
                icon: "assets/icons/ic_about.png",
                title: "Tentang Kami"),
            const Text(
              "Bahasa",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Row(
              children: [
                Expanded(child: ProfileItem(icon: "assets/icons/ic_indonesia.png", title: "Indonesia")),
                Expanded(child: ProfileItem(icon: "assets/icons/ic_english.png", title: "Inggris")),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Versi "),
                Text(
                  "1.0.1",
                  style: TextStyle(color: AppStyle.yellowColor),
                ),
              ],
            ),
            const SizedBox(
              height: 100.0,
            ),
          ],
        ));
  }
}
