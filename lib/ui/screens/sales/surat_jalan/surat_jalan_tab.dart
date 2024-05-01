import 'package:flutter/material.dart';
import 'package:steven_sales_app/ui/screens/sales/surat_jalan/card_surat_jalan.dart';
import 'package:steven_sales_app/utils/enum.dart';

import '../../../../common/app_style.dart';
import '../../../widgets/label_widget.dart';

class SuratJalanTab extends StatelessWidget {
  const SuratJalanTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: [
        CardSuratJalan(
          idSJ: "2230301071",
          statusSJ: StatusSJ.Draft,
          colorSJ: AppStyle.blueColor,
          widgetStatusSJ: LabelWidget(
            label: StatusSJ.Draft.name,
            bgColor: AppStyle.lightBlueColor,
            textColor: AppStyle.blueColor,
            radius: 5,
          ),
        ),
        CardSuratJalan(
          idSJ: "2230301071",
          statusSJ: StatusSJ.Reject,
          colorSJ: AppStyle.redColor,
          widgetStatusSJ: LabelWidget(
            label: StatusSJ.Reject.name,
            bgColor: AppStyle.lightRedColor,
            textColor: AppStyle.redColor,
            radius: 5,
          ),
        ),
        CardSuratJalan(
          idSJ: "2230301071",
          statusSJ: StatusSJ.Open,
          colorSJ: AppStyle.greenColor,
          widgetStatusSJ: LabelWidget(
            label: StatusSJ.Open.name,
            bgColor: AppStyle.lightGreenColor,
            textColor: AppStyle.greenColor,
            radius: 5,
          ),
        ),
        CardSuratJalan(
          idSJ: "2230301071",
          statusSJ: StatusSJ.Transfer,
          colorSJ: AppStyle.yellowColor,
          widgetStatusSJ: LabelWidget(
            label: StatusSJ.Transfer.name,
            bgColor: AppStyle.lightYellowColor,
            textColor: AppStyle.yellowColor,
            radius: 5,
          ),
        ),
        const CardSuratJalan(
          idSJ: "2230301071",
          statusSJ: StatusSJ.Draft,
          colorSJ: AppStyle.blueColor,
          widgetStatusSJ: LabelWidget(
            label: "Draft",
            bgColor: AppStyle.lightBlueColor,
            textColor: AppStyle.blueColor,
            radius: 5,
          ),
        ),
      ],
    );
  }
}
