
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weatherapp_zeoptic/utils/apptextstyles.dart';

class BuildGlassCard extends StatelessWidget {
  const BuildGlassCard({
    super.key,
    required this.time,
    required this.temp,
    required this.icon,
  });
  final String time;
  final String temp;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 70,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 1.5,
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(time,
                      style: MyAppTextStyles.subtitle.copyWith(fontSize: 14)),
                  Image(
                    image: AssetImage(icon),
                    height: 40,
                  ),
                  Text(temp, style: MyAppTextStyles.forecastTemperature),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}