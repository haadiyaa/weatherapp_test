import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weatherapp_zeoptic/utils/appcolors.dart.dart';
import 'package:weatherapp_zeoptic/utils/appdimensions.dart';
import 'package:weatherapp_zeoptic/utils/apptextstyles.dart';
import 'package:weatherapp_zeoptic/view/widgets/froastedglassbox.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              MyAppColors.backgroundTop,
              MyAppColors.backgroundMiddle,
              MyAppColors.backgroundBottom,
            ],
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Text(
                'INDIA',
                style: MyAppTextStyles.subtitle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Current Location',
                style: MyAppTextStyles.subtitle,
              ),
              const SizedBox(height: 20),
              const Icon(Icons.cloud, color: Colors.white, size: 100),
              const Text('13°', style: MyAppTextStyles.mainTemperature),
              const SizedBox(height: 10),
              const Text(
                'Partly Cloud - H:17° L:4°',
                style: MyAppTextStyles.subtitle,
              ),
              const SizedBox(height: 40),
              Container(
                decoration: BoxDecoration(
                  color: MyAppColors.buttonUnselected,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Today Button
                    Expanded(
                      child: Container(
                        height: MyAppDimensions.buttonHeight,
                        decoration: BoxDecoration(
                          color: MyAppColors.buttonSelected,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: Text(
                            'Today',
                            style: MyAppTextStyles.cardTitle,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: MyAppDimensions.buttonHeight,
                        child: const Center(
                          child: Text(
                            'Next Days',
                            style: MyAppTextStyles.cardTitle,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildGlassForecastCard('Now', '13°', Icons.wb_sunny),
                    _buildGlassForecastCard('4PM', '14°', Icons.wb_sunny),
                    _buildGlassForecastCard('5PM', '12°', Icons.cloud),
                    _buildGlassForecastCard('6PM', '8°', Icons.beach_access),
                    _buildGlassForecastCard('7PM', '9°', Icons.bolt),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              FrostedGlassBox(
                width: size.width * 0.9,
                height: size.height * 0.12,
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.wb_sunny, color: Colors.white),
                        SizedBox(width: 8),
                        Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Sunset', style: MyAppTextStyles.cardTitle),
                        SizedBox(height: 8),
                        Text('5:51PM', style: MyAppTextStyles.cardValue),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Sunset', style: MyAppTextStyles.cardTitle),
                        SizedBox(height: 8),
                        Text('5:51PM', style: MyAppTextStyles.cardValue),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

   Widget _buildGlassForecastCard(String time, String temp, IconData icon) {
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
                  color: Colors.white.withOpacity(0.1), // Frosted glass effect
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
                  Text(time, style: MyAppTextStyles.subtitle.copyWith(fontSize: 14)),
                  Icon(icon, size: MyAppDimensions.forecastIconSize, color: Colors.white),
                  Text(temp, style: MyAppTextStyles.forecastTemperature),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String title, String value, IconData icon) {
    return Container(
      width: 160,
      height: MyAppDimensions.cardHeight,
      decoration: BoxDecoration(
        color: MyAppColors.cardBackground,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(height: 8),
          Text(title, style: MyAppTextStyles.cardTitle),
          const SizedBox(height: 8),
          Text(value, style: MyAppTextStyles.cardValue),
        ],
      ),
    );
  }
}
