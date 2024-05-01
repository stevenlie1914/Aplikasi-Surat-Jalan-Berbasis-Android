// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../common/app_style.dart';
import '../../../../widgets/row_label_value.dart';
import '../../../../widgets/row_label_widget.dart';

class SJKembali extends StatefulWidget {
  const SJKembali({Key? key}) : super(key: key);

  @override
  State<SJKembali> createState() => _SJKembaliState();
}

class _SJKembaliState extends State<SJKembali> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          thickness: 5,
          color: AppStyle.lightGreyColor,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 15,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset("assets/icons/ic_doc_download.png"),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Text(
                    "SJ Kembali",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              RowLabelWidget(
                label: "SJ Kembali",
                widget: SizedBox(
                  height: 20,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: CupertinoSwitch(
                      activeColor: AppStyle.redColor,
                      value: true,
                      onChanged: (val) {},
                    ),
                  ),
                ),
              ),
              const RowLabelValue(label: "Shift Kembali", value: "2"),
              const RowLabelValue(label: "Update Date", value: "2023-05-29 15:55"),
            ],
          ),
        ),
      ],
    );
  }
}
