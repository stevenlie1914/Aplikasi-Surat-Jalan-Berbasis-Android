import 'package:flutter/material.dart';

import '../../../../../common/app_style.dart';
import '../../../../widgets/form_label.dart';

class QuantityItem extends StatefulWidget {
  const QuantityItem({super.key});

  @override
  State<QuantityItem> createState() => _QuantityItemState();
}

class _QuantityItemState extends State<QuantityItem> {
  String? selectedSatuan;

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
                  Image.asset("assets/icons/ic_box.png"),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Text(
                    "Quantity",
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
              const Row(
                children: [
                  Expanded(
                      child: FormLabel(
                    label: "Volume Asal",
                    hintText: "0000",
                  )),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(child: FormLabel(label: "Volume Tujuan", hintText: "0000")),
                ],
              ),
              Row(
                children: [
                  const Expanded(child: FormLabel(label: "Volume Netto", hintText: "0000")),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Satuan",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        SizedBox(
                          height: 45,
                          child: DropdownButtonFormField<String>(
                            value: selectedSatuan,
                            onChanged: (String? value) {
                              setState(() {
                                selectedSatuan = value;
                              });
                            },
                            items: <String>[
                              'tonasi',
                              'kubikasi',
                              'rit',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: "Pilih Satuan",
                              hintStyle: const TextStyle(
                                fontSize: 14,
                              ),
                              enabledBorder: OutlineInputBorder(
                                //<-- SEE HERE
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(color: AppStyle.greyColor, width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                //<-- SEE HERE
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(color: AppStyle.greyColor, width: 1),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
