// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:steven_sales_app/common/app_style.dart';
import 'package:steven_sales_app/ui/screens/dashboard/dashboard_menu_item.dart';
import 'package:steven_sales_app/ui/screens/sales/surat_jalan_tabbar.dart';
import 'package:steven_sales_app/ui/widgets/vertical_slider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Semangat Kerja !"),
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              Container(
                height: 50,
                decoration: const BoxDecoration(
                  color: AppStyle.redColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(150),
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: AppStyle.whiteColor,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        offset: const Offset(0, 3),
                        color: AppStyle.blackColor.withOpacity(0.25),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                        height: 70,
                        width: 70,
                      ),
                      const SizedBox(
                        width: 25.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Container(
              height: 82,
              decoration: BoxDecoration(
                color: AppStyle.redColor,
                borderRadius: BorderRadius.circular(
                  15,
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  VerticalSlider(),
                  DashboardMenuItem(
                    image: "assets/icons/ic_absensi.png",
                    title: "Absensi",
                    textColor: AppStyle.whiteColor,
                  ),
                  DashboardMenuItem(
                    image: "assets/icons/ic_kasbon.png",
                    title: "Kasbon",
                    textColor: AppStyle.whiteColor,
                  ),
                  DashboardMenuItem(
                    image: "assets/icons/ic_slip_gaji.png",
                    title: "Slip Gaji",
                    textColor: AppStyle.whiteColor,
                  ),
                  SizedBox()
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SuratJalanTabbar(),
                        ),
                      ),
                  child: const DashboardMenuItem(image: "assets/images/img_penjualan.png", title: "Penjualan")),
              const DashboardMenuItem(image: "assets/images/img_keuangan.png", title: "Keuangan"),
            ],
          ),
          const SizedBox(
            height: 75.0,
          ),
          Image.asset(
            "assets/images/img_sampurna_home.png",
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
