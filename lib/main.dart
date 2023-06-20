import 'package:calculator/screens/calculator_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "calculator",
    debugShowCheckedModeBanner: false,
    routes: {
      CalculatorScreen.routeName:(_)=>CalculatorScreen(),
    },
    initialRoute: CalculatorScreen.routeName,
  ));
}
