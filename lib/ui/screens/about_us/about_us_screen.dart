import 'package:flutter/material.dart';

import '../../../common/app_style.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tentang Kami"),
      ),
      body: ListView(
        children: [
          Image.asset(
            "assets/images/img_about_us.png",
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sampurna Group",
                  style: TextStyle(
                    color: AppStyle.blackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                const Text(
                  "Sampurna Group merupakan suatu perusahan yang bergerak pada bidang jasa transportasi dengan memiliki 3 anak perusahaan yaitu PT ALAM SAMPURNA MAKMUR, PT NIAGA CITRA ABADI , dan PT SAMPURNA MAKMUR SEJAHTERA dengan berawal hanya memiliki unit Dump Truck hingga kini memiliki ratusan armada kendaraan angkutan dengan berbagai jenis, tidak hanya bergerak dibidang jasa transportasi Sampurna Group juga menawarkan beberapa jenis material.",
                  style: TextStyle(
                    color: AppStyle.blackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                const Text(
                  "On Time, On Task, On Call",
                  style: TextStyle(
                    color: AppStyle.blackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "Sampurna Group",
                  style: TextStyle(
                    color: AppStyle.blackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const Text(
                  "Ruko Santa Monica No.B16, Kelapa Dua, Kelapa Dua, Kabupaten Tangerang, Banten",
                  style: TextStyle(
                    color: AppStyle.blackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 60.0,
                ),
                Center(child: Image.asset("assets/icons/ic_logo_group.png")),
                const SizedBox(
                  height: 10.0,
                ),
                const Center(
                  child: Text(
                    "Sampurna Group",
                    style: TextStyle(
                      color: AppStyle.blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Center(
                  child: Text(
                    "©2023 Sampurna Group",
                    style: TextStyle(
                      color: AppStyle.blackColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
