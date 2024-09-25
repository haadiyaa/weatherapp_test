import 'package:flutter/material.dart';
import 'package:weatherapp_zeoptic/utils/appcolors.dart.dart';

class MyAppTextStyles {
  static const TextStyle mainTemperature = TextStyle(
    fontSize: 94,
    fontWeight: FontWeight.w400,
    color: MyAppColors.mainText,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: MyAppColors.subtitleText,
  );

  static const TextStyle location = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    // color: MyAppColors.mainText,
  );

  static const TextStyle forecastTemperature = TextStyle(
    fontSize: 16,
    color: MyAppColors.forecastText,
  );

  static const TextStyle cardTitle = TextStyle(
    fontSize: 14,
    color: MyAppColors.mainText,
  );

  static const TextStyle cardValue = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: MyAppColors.mainText,
  );
}
