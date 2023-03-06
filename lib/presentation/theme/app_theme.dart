import 'package:flutter/material.dart';

abstract class AppTheme {
  static const Color backgroundColor = Color(0XFF121013);
  static const Color darkGreyColor = Color(0xFF232222);
  static const Color mediumGreyColor = Color(0xFF646165);
  static const Color lightGreyColor = Color(0xFFD9D9D9);

  static BoxDecoration boxDecoration(
      {Color backgroundColor = AppTheme.mediumGreyColor}) =>
      BoxDecoration(
        color: AppTheme.mediumGreyColor,
        borderRadius: BorderRadius.circular(5),
      );

  static const TextTheme textTheme = TextTheme(
    titleLarge: TextStyle(fontSize: 18),
    titleMedium: TextStyle(fontSize: 15),
    bodySmall: TextStyle(fontSize: 11),
  );

  static ThemeData theme = ThemeData().copyWith(
    scaffoldBackgroundColor: backgroundColor,
    primaryColor: Colors.white,
    textTheme: textTheme,
    colorScheme: ThemeData().colorScheme.copyWith(
      primary: Colors.white,
      secondary: Colors.red,
      background: backgroundColor,
    ),
  );
}
