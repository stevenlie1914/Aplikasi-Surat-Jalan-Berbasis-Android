import 'package:flutter/material.dart';
import 'package:steven_sales_app/common/app_style.dart';
import 'package:steven_sales_app/ui/screens/onboarding/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: 'Quicksand',
          colorScheme: const ColorScheme.light(
            primary: Color(0xFF1455AC),
            secondary: AppStyle.redColor,
            onSecondary: AppStyle.whiteColor,
            tertiary: Color(0xFFF9D4A8),
            tertiaryContainer: Color(0xFFADC9F3),
            onTertiaryContainer: Color(0xFF33AF74),
            primaryContainer: Color(0xFF9AECC6),
            secondaryContainer: Color(0xFFF2F2F2),
          ),
          useMaterial3: false,
          appBarTheme: const AppBarTheme(
            color: AppStyle.redColor,
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
            elevation: 0,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: AppStyle.redColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(12),
            labelStyle: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.grey[400],
            ),
            floatingLabelStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: const BorderSide(color: Colors.redAccent),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
              borderSide: const BorderSide(color: Colors.redAccent),
            ),
          ),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          })),
      home: const OnBoardingScreen(),
    );
  }
}
