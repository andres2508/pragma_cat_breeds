import 'package:flutter/material.dart';

class TextStyles {
  // Params default for styles
  static const double titleSize = 24.0;
  static const double subtitle1Size = 22.0;
  static const double subtitle2Size = 20.0;
  static const double normalSize = 18.0;
  static const double minimalSize = 16.0;

  static const TextStyle normalStyle =
      TextStyle(fontSize: TextStyles.normalSize);
  static const TextStyle buttonStyle = TextStyle(
      fontSize: TextStyles.normalSize,
      fontWeight: FontWeight.w500,
      color: Colors.white);
}
