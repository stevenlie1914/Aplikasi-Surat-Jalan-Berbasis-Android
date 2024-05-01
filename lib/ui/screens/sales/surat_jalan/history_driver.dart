import 'package:flutter/material.dart';
import 'package:steven_sales_app/ui/screens/sales/surat_jalan/history_driver_item.dart';
import 'package:steven_sales_app/ui/widgets/card_shadow.dart';
import 'package:steven_sales_app/ui/widgets/primary_button.dart';

class HistoryDriver extends StatelessWidget {
  const HistoryDriver({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History Surat Jalan"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        children: const [
          CardShadow(
            padding: EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 8,
            ),
            shadowOpacity: 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "DT2303691",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "2023-03-27",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                Text(
                  "3/10",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
          CardShadow(
              padding: EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 8,
              ),
              shadowOpacity: 0.1,
              child: Column(
                children: [
                  HistoryDriverItem(),
                  Divider(
                    thickness: 1,
                  ),
                  HistoryDriverItem(),
                  Divider(
                    thickness: 1,
                  ),
                  HistoryDriverItem(),
                ],
              ))
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 15,
        ),
        child: PrimaryButton(
            label: "Create SJ",
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            }),
      ),
    );
  }
}
