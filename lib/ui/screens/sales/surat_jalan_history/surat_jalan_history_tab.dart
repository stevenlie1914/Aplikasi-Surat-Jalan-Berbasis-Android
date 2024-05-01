import 'package:flutter/material.dart';
import 'package:steven_sales_app/ui/screens/sales/surat_jalan_history/card_surat_jalan_history.dart';

class SuratJalanHistoryTab extends StatelessWidget {
  const SuratJalanHistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: const [
        CardSuratJalanHistory(
          idSJ: "DT2303691",
          progressCount: 3,
          goalsCount: 10,
        ),
        CardSuratJalanHistory(
          idSJ: "DT2303692",
          progressCount: 10,
          goalsCount: 10,
        ),
        CardSuratJalanHistory(
          idSJ: "DT2303693",
          progressCount: 6,
          goalsCount: 10,
        ),
        CardSuratJalanHistory(
          idSJ: "DT2303694",
          progressCount: 3,
          goalsCount: 5,
        ),
      ],
    );
  }
}
