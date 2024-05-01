import 'package:flutter/material.dart';

import '../../common/app_style.dart';

class DropdownLabel<T> extends StatefulWidget {
  final String label;
  final List<T> items;
  final T? initialValue;
  final void Function(T?) onChanged;

  const DropdownLabel({
    super.key,
    required this.label,
    required this.items,
    this.initialValue,
    required this.onChanged,
  });

  @override
  State<DropdownLabel<T>> createState() => _DropdownLabelState<T>();
}

class _DropdownLabelState<T> extends State<DropdownLabel<T>> {
  T? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        SizedBox(
          height: 45,
          child: DropdownButtonFormField<T>(
            menuMaxHeight: 200,
            isExpanded: true,
            isDense: true,
            value: _selectedItem,
            items: widget.items.map((T item) {
              return DropdownMenuItem<T>(
                value: item,
                child: Text('$item'),
              );
            }).toList(),
            onChanged: (T? selectedItem) {
              setState(() {
                _selectedItem = selectedItem;
                widget.onChanged(selectedItem);
              });
            },
            decoration: InputDecoration(
              isDense: true,
              hintText: "Pilih ${widget.label}",
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
          height: 10.0,
        ),
      ],
    );
  }
}
