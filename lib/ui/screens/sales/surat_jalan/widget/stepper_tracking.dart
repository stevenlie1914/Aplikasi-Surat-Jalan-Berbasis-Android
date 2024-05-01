import 'package:flutter/material.dart';
import 'package:steven_sales_app/common/app_style.dart';
import 'package:steven_sales_app/ui/screens/sales/surat_jalan/widget/stepper_row.dart';
import 'package:steven_sales_app/ui/widgets/stepper_widget.dart' as st;

class StepperTracking extends StatefulWidget {
  const StepperTracking({super.key});

  @override
  State<StepperTracking> createState() => _StepperTrackingState();
}

class _StepperTrackingState extends State<StepperTracking> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: AppStyle.redColor,
        ),
      ),
      child: st.Stepper(
        // currentStep: currentStep,
        steps: const <st.Step>[
          st.Step(
            title: StepperRow(
              title: "Transfer, 19 Maret 2023",
              subtitle: "Lorem Ipsum dolor is amet",
              date: "19:20 WIB",
            ),
            isActive: true,
          ),
          st.Step(
            title: StepperRow(
              title: "Transfer, 19 Maret 2023",
              subtitle: "Lorem Ipsum dolor is amet",
              date: "19:20 WIB",
            ),
            isActive: true,
          ),
          st.Step(
            title: StepperRow(
              title: "Transfer, 19 Maret 2023",
              subtitle: "Lorem Ipsum dolor is amet",
              date: "19:20 WIB",
            ),
            isActive: true,
          ),
          st.Step(
            title: StepperRow(
              title: "Transfer, 19 Maret 2023",
              subtitle: "Lorem Ipsum dolor is amet",
              date: "19:20 WIB",
            ),
            isActive: true,
          ),
          st.Step(
            title: StepperRow(
              title: "Transfer, 19 Maret 2023",
              subtitle: "Lorem Ipsum dolor is amet",
              date: "19:20 WIB",
            ),
            isActive: true,
          ),
        ],
      ),
    );
  }
}
