
import 'package:flutter/material.dart';
import 'package:weatherapp_zeoptic/model/weathercurrentmodel.dart';
import 'package:weatherapp_zeoptic/utils/apptextstyles.dart';
import 'package:weatherapp_zeoptic/view/widgets/froastedglassbox.dart';

class ValuesTile extends StatelessWidget {
  const ValuesTile({
    super.key,
    required this.size,
    required this.data,
  });

  final Size size;
  final WeatherCurrentModel data;

  @override
  Widget build(BuildContext context) {
    return FrostedGlassBox(
      width: size.width * 0.9,
      height: size.height * 0.12,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Pressure', style: MyAppTextStyles.cardTitle),
              const SizedBox(height: 8),
              Text(data.main.pressure.toString(),
                  style: MyAppTextStyles.cardValue),
            ],
          ),
          const SizedBox(width: 8),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Humidity', style: MyAppTextStyles.cardTitle),
              const SizedBox(height: 8),
              Text(data.main.humidity.toString(),
                  style: MyAppTextStyles.cardValue),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Wind Speed', style: MyAppTextStyles.cardTitle),
              const SizedBox(height: 8),
              Text(data.wind.speed.toString(),
                  style: MyAppTextStyles.cardValue),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Visibility', style: MyAppTextStyles.cardTitle),
              const SizedBox(height: 8),
              Text(data.visibility.toString(),
                  style: MyAppTextStyles.cardValue),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
