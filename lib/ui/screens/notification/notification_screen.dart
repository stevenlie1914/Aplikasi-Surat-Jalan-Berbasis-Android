// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:steven_sales_app/common/app_style.dart';
import 'package:steven_sales_app/ui/screens/notification/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
        actions: const [],
      ),
      body: ListView(
        children: const [
          NotificatonItem(title: "Absensi", content: "Selamat kamu berhasil absen hari ini", date: "2023-03-27"),
          Divider(
            height: 0,
            color: AppStyle.lightGreyColor,
            endIndent: 20,
            indent: 20,
            thickness: 2,
          ),
          NotificatonItem(title: "Absensi", content: "Cuti kamu sedang dalam antrian", date: "2023-03-27"),
          Divider(
            height: 0,
            color: AppStyle.lightGreyColor,
            endIndent: 20,
            indent: 20,
            thickness: 2,
          ),
          NotificatonItem(title: "Absensi", content: "Selamat cuti kamu sudah di Approved", date: "2023-03-27"),
          Divider(
            height: 0,
            color: AppStyle.lightGreyColor,
            endIndent: 20,
            indent: 20,
            thickness: 2,
          ),
          NotificatonItem(title: "Absensi", content: "Maaf cuti kamu belum terpenuhi", date: "2023-03-27"),
        ],
      ),
    );
  }
}
