import 'package:calculator/provider/provider.dart';
import 'package:calculator/screens/calculator_screen.dart';
import 'package:calculator/utilities/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) {
      return ThemeProvider();
    },
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of(context);
    return MaterialApp(
      themeMode: provider.currentTheme,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      title: "calculator",
      debugShowCheckedModeBanner: false,
      routes: {
        CalculatorScreen.routeName: (_) => CalculatorScreen(),
      },
      initialRoute: CalculatorScreen.routeName,
    );
  }
}
