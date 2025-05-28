import 'package:agecalculator/pages/splashscreen.dart';
import 'package:flutter/material.dart';
import 'pages/age_calculator_page.dart';

void main() => runApp(AgeCalculatorApp());

class AgeCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Age Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF1e1e1e),
        colorScheme: ColorScheme.dark(primary: Colors.orange),
      ),
      home: SplashScreen(),
    );
  }
}
