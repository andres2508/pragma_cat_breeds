import 'package:cat_breeds/styles/color.styles.dart';
import 'package:cat_breeds/styles/text.styles.dart';
import 'package:flutter/material.dart';

class PragmaMaterialTheme {
  static ThemeData light = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
    ),
    primaryColor: ColorStyles.accentColor,
    primaryColorDark: ColorStyles.darkColor,
    colorScheme: ColorScheme.fromSeed(seedColor: ColorStyles.darkColor),
    // fontFamily: GoogleFonts.roboto().fontFamily,
    textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: TextStyles.titleSize),
        bodyLarge: TextStyle(fontSize: TextStyles.titleSize),
        labelLarge: TextStyle(fontSize: TextStyles.subtitle2Size),
        labelMedium: TextStyle(fontSize: TextStyles.normalSize),
        labelSmall: TextStyle(fontSize: TextStyles.minimalSize)),
    useMaterial3: true,
    inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(fontSize: TextStyles.minimalSize),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 10)),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.white,
      labelStyle: TextStyle(
          fontSize: TextStyles.subtitle2Size, fontWeight: FontWeight.w500),
      unselectedLabelColor: Colors.black26,
      unselectedLabelStyle: TextStyle(
          fontSize: TextStyles.subtitle2Size, fontWeight: FontWeight.w500),
      indicatorColor: Colors.white,
    ),
  );
}