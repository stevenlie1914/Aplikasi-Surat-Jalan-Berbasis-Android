// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../../common/app_style.dart';

class FormLabel extends StatelessWidget {
  final String label;
  final String? hintText;
  final TextInputType? keyboardType;

  const FormLabel({
    Key? key,
    required this.label,
    this.hintText,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        TextFormField(
          keyboardType: keyboardType,
          maxLines: (keyboardType == TextInputType.multiline) ? 4 : 1,
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
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
        const SizedBox(
          height: 5.0,
        ),
      ],
    );
  }
}
