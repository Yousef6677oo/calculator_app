import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColor.primaryColorLight,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColor.primaryColorLight, centerTitle: true),
      textTheme: TextTheme(
        titleLarge: TextStyle(fontSize: 65, color: AppColor.accentColorLight),
        titleMedium: TextStyle(fontSize: 30, color: AppColor.accentColorLight),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(AppColor.primaryColorLight),
        shadowColor:
            MaterialStateProperty.all<Color>(AppColor.shadowColorLight),
        elevation: MaterialStateProperty.all<double>(5),
      )));
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColor.primaryColorDark,
      appBarTheme: AppBarTheme(
          backgroundColor: AppColor.primaryColorDark, centerTitle: true),
      textTheme: TextTheme(
        titleLarge: TextStyle(fontSize: 65, color: AppColor.accentColorDark),
        titleMedium: TextStyle(fontSize: 30, color: AppColor.accentColorDark),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor:MaterialStateProperty.all<Color>(AppColor.buttonColorDark),
        shadowColor: MaterialStateProperty.all<Color>(AppColor.shadowColorDark),
        elevation: MaterialStateProperty.all<double>(5),
      )));
}
