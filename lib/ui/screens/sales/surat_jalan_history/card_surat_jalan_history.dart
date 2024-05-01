import 'package:flutter/material.dart';

import 'package:steven_sales_app/common/app_style.dart';
import 'package:steven_sales_app/ui/screens/sales/surat_jalan/form_surat_jalan.dart';
import 'package:steven_sales_app/ui/widgets/label_widget.dart';

class CardSuratJalanHistory extends StatelessWidget {
  final String idSJ;
  final int progressCount;
  final int goalsCount;
  const CardSuratJalanHistory({
    Key? key,
    required this.idSJ,
    required this.progressCount,
    required this.goalsCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppStyle.whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 7,
            offset: const Offset(
              0,
              1,
            ),
            color: AppStyle.blackColor.withOpacity(
              0.1,
            ),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    idSJ,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Text(
                    "2023-03-27",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                "$progressCount/$goalsCount",
                style: const TextStyle(
                  color: AppStyle.greyColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              const LabelWidget(
                  label: "Reguler", bgColor: AppStyle.lightYellowColor, textColor: AppStyle.yellowColor, radius: 3),
              const Icon(
                Icons.more_vert,
                color: AppStyle.greyColor,
              ),
            ],
          ),
          const Divider(
            thickness: 1,
          ),
          const Text(
            "Bata Merah Sumber\nGunung Maju, PT.\nSGM - ADH Kebon Jeruk",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Tronton / Dump Truck",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              progressCount == goalsCount
                  ? const SizedBox()
                  : InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FormSuratJalan(),
                        ),
                      ),
                      child: const LabelWidget(
                        label: "Create SJ",
                        bgColor: AppStyle.redColor,
                        textColor: AppStyle.whiteColor,
                        radius: 5,
                      ),
                    )
            ],
          )
        ],
      ),
    );
  }
}
