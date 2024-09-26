import 'package:flutter/material.dart';

class MyAppConstants {
  static const Map icons={
    "Thunderstorm":"assets/icons/thunderstorm.png",
    "Drizzle":"assets/icons/drizzle.png",
    "Rain":"assets/icons/rain.png",
    "Snow":"assets/icons/snow.png",
    "Mist":"assets/icons/mist.png",
    "Haze":"assets/icons/haze.png",
    "Fog":"assets/icons/fog.png",
    "Clear":"assets/icons/clear.png",
    "Clouds":"assets/icons/clouds.png",
  };
  static const Map<String, List<Color>> weatherGradients = {
  "Thunderstorm": [
    Color(0xFF1C1C1C), // Dark gray
    Color(0xFF3B3B3B), // Medium dark gray
    Color(0xFF616161), // Lighter gray
  ],
  "Drizzle": [
    Color(0xFF79868E), // Muted blue-gray
    Color(0xFF9DAAB2), // Lighter blue-gray
    Color(0xFFBFC7CD), // Very light grayish blue
  ],
  "Rain": [
    Color(0xFF4A667D), // Deep blue-gray
    Color(0xFF6C889B), // Medium grayish blue
    Color(0xFFB1C5D1), // Light bluish-gray
  ],
  "Snow": [
    Color(0xFFD1E3F4), // Pale blue
    Color(0xFFE6F2FA), // Very light blue
    Color(0xFFFFFFFF), // Pure white
  ],
  "Mist": [
    Color(0xFFB5B5B5), // Light gray
    Color(0xFFD6D6D6), // Very light gray
    Color(0xFFE9E9E9), // Almost white
  ],
  "Haze": [
    Color(0xFFD1C5B2), // Beige
    Color(0xFFE0D6C7), // Pale warm beige
    Color(0xFFF5EDE4), // Light cream
  ],
  "Fog": [
    Color(0xFF8A9AA7), // Blue-gray
    Color(0xFFA1B2C1), // Lighter blue-gray
    Color(0xFFC9D6DF), // Very pale blue
  ],
  "Clear": [
    Color(0xFF4FC3F7), // Bright sky blue
    Color(0xFF81D4FA), // Lighter sky blue
    Color(0xFFB3E5FC), // Pale sky blue
  ],
  "Clouds": [
    Color(0xFFBDC3C7), // Grayish-blue
    Color(0xFFD7DBDD), // Lighter gray
    Color(0xFFECF0F1), // Very light gray
  ],
};

}