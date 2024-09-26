
import 'package:flutter/material.dart';
import 'package:weatherapp_zeoptic/model/weathercurrentmodel.dart';
import 'package:weatherapp_zeoptic/utils/apptextstyles.dart';

class Description extends StatelessWidget {
  const Description({
    super.key,
    required this.desc,
  });

  final WeatherCurrentModel desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          desc.name,
          style: MyAppTextStyles.subtitle,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          '${desc.weather[0].main.toUpperCase()} - ${desc.weather[0].description.toUpperCase()}',
          style: MyAppTextStyles.subtitle,
        ),
      ],
    );
  }
}