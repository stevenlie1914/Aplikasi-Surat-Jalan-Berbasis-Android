import 'package:flutter/material.dart';
import 'package:steven_sales_app/common/app_style.dart';
import 'package:steven_sales_app/ui/screens/sales/surat_jalan/widget/stepper_tracking.dart';
import 'package:steven_sales_app/ui/widgets/column_label_value.dart';

import 'package:steven_sales_app/utils/enum.dart';

class TrackingOrder extends StatefulWidget {
  final StatusSJ statusSJ;
  final String idSJ;
  final Color colorSJ;
  const TrackingOrder({
    Key? key,
    required this.statusSJ,
    required this.idSJ,
    required this.colorSJ,
  }) : super(key: key);

  @override
  State<TrackingOrder> createState() => _TrackingOrderState();
}

class _TrackingOrderState extends State<TrackingOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lacak"),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 25,
                width: 5,
                decoration: BoxDecoration(
                    color: widget.colorSJ,
                    borderRadius: const BorderRadius.horizontal(
                      right: Radius.circular(
                        3,
                      ),
                    )),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                widget.statusSJ.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 5,
            color: AppStyle.lightGreyColor,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ColumnLabelValue(
                      label: "SJ",
                      value: "0000246586846465",
                    ),
                    ColumnLabelValue(
                      label: "Asal",
                      value: "Cibitung",
                    ),
                    ColumnLabelValue(
                      label: "Perusahaan",
                      value: "PT.Alam Sampurna Makmur",
                    ),
                    ColumnLabelValue(
                      label: "Produk",
                      value: "Bata merah",
                    ),
                  ],
                ),
                SizedBox(
                  width: 20.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ColumnLabelValue(
                      label: "Tanggal SJ",
                      value: "2023-05-20",
                    ),
                    ColumnLabelValue(
                      label: "Tujuan",
                      value: "Cijantung",
                    ),
                    ColumnLabelValue(
                      label: "Bisnis Unit",
                      value: "Dump Truck",
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 5,
            color: AppStyle.lightGreyColor,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order Status",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                StepperTracking(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
