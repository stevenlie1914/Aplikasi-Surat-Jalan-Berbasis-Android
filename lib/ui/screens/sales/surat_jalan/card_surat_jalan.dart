import 'package:flutter/material.dart';
import 'package:steven_sales_app/common/app_style.dart';
import 'package:steven_sales_app/ui/screens/sales/surat_jalan/detail_surat_jalan.dart';
import 'package:steven_sales_app/ui/widgets/label_widget.dart';
import 'package:steven_sales_app/utils/enum.dart';

class CardSuratJalan extends StatelessWidget {
  final Widget widgetStatusSJ;
  final StatusSJ statusSJ;
  final String idSJ;
  final Color colorSJ;
  const CardSuratJalan(
      {super.key, required this.widgetStatusSJ, required this.idSJ, required this.statusSJ, required this.colorSJ});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/img_default_sj.png"),
              const SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    idSJ,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Row(
                    children: [
                      Text(
                        "B 9847 JYT ",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "| Wing Box",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "Darobi",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  const Text(
                    "Solusi Bangun Beton,PT.",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    "SBB - SERPONG",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailSuratJalan(
                                idSJ: idSJ,
                                colorSJ: colorSJ,
                                statusSJ: statusSJ,
                              ),
                            ),
                          );
                        },
                        child: widgetStatusSJ,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const LabelWidget(
                        label: "Reguler",
                        bgColor: AppStyle.lightYellowColor,
                        textColor: AppStyle.yellowColor,
                        radius: 5,
                      )
                    ],
                  )
                ],
              ),
              const Spacer(),
              const Text(
                "2023-03-27",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
