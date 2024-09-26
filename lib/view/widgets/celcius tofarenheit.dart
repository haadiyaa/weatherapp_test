
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp_zeoptic/blocs/togglecubit/toggle_cubit.dart';
import 'package:weatherapp_zeoptic/utils/appcolors.dart.dart';

class CelciusToFaren extends StatelessWidget {
  const CelciusToFaren({
    super.key,
    required this.isFaranheitt,
  });

  final bool isFaranheitt;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Celsius"),
        Switch(
          trackOutlineColor:
              MaterialStateProperty.all(MyAppColors.transparent),
          inactiveThumbColor: MyAppColors.forecastText,
          inactiveTrackColor: MyAppColors.backgroundBottom,
          activeTrackColor: MyAppColors.forecastText,
          activeColor: MyAppColors.backgroundBottom,
          value: isFaranheitt,
          onChanged: (value) {
            context.read<ToggleCubit>().toggleUnit();
          },
        ),
        const Text("Fahrenheit"),
      ],
    );
  }
}
