import 'package:flutter/material.dart';
import 'package:steven_sales_app/common/app_style.dart';

class MultiSelectWidget extends StatefulWidget {
  final List<String> items;

  const MultiSelectWidget({super.key, required this.items});

  @override
  State<MultiSelectWidget> createState() => _MultiSelectChip();
}

class _MultiSelectChip extends State<MultiSelectWidget> {
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8.0,
      runSpacing: 10.0,
      children: widget.items.map((item) {
        bool isSelected = selectedItems.contains(item);
        return GestureDetector(
          onTap: () {
            setState(() {
              if (isSelected) {
                selectedItems.remove(item);
              } else {
                selectedItems.add(item);
              }
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
                color: isSelected ? AppStyle.lightRedColor : Colors.transparent,
                border: Border.all(color: isSelected ? AppStyle.redColor : AppStyle.greyColor),
                borderRadius: BorderRadius.circular(5)),
            child: Text(
              item,
              style: TextStyle(color: isSelected ? AppStyle.redColor : AppStyle.greyColor),
            ),
          ),
        );
      }).toList(),
    );
  }
}
