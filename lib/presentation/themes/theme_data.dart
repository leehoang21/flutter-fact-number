import 'package:flutter/material.dart';

import 'theme_color.dart';
import 'theme_text.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: 'QS',
    textTheme: TextTheme(
      titleMedium: ThemeText.titleApp,
      bodySmall: ThemeText.bodySmall,
      bodyMedium: ThemeText.bodyMedium,
      bodyLarge: ThemeText.bodyLarge,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      prefixIconColor: AppColor.ebonyClay,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColor.primaryColor,
      contentTextStyle: ThemeText.bodyMedium,
    ),
    primaryColor: AppColor.primaryColor,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: AppColor.buttonColor,
      ),
    ),
    scaffoldBackgroundColor: AppColor.backgroundColor,
    appBarTheme: const AppBarTheme(
      color: AppColor.appbarColor,
      elevation: 0.0,
    ),
  );
}

ThemeData appThemeDark() {
  return ThemeData(
    scaffoldBackgroundColor: AppColor.backgroundColorDark,
    fontFamily: 'QS',
    inputDecorationTheme: const InputDecorationTheme(
      prefixIconColor: AppColor.lightGrey,
    ),
    textTheme: TextTheme(
      titleMedium: ThemeTextDark.titleApp,
      bodySmall: ThemeTextDark.bodySmall,
      bodyMedium: ThemeTextDark.bodyMedium,
      bodyLarge: ThemeTextDark.bodyLarge,
    ),
    primaryColor: AppColor.primaryColorDark,
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColor.primaryColorDark,
      contentTextStyle: ThemeText.bodyMedium,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: AppColor.buttonColorDark,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: AppColor.appbarColorDark,
      elevation: 0.0,
    ),
  );
}
