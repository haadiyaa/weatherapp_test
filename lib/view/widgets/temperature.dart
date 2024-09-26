
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp_zeoptic/blocs/togglecubit/toggle_cubit.dart';
import 'package:weatherapp_zeoptic/model/weathercurrentmodel.dart';
import 'package:weatherapp_zeoptic/utils/appconstants.dart';
import 'package:weatherapp_zeoptic/utils/apptextstyles.dart';
import 'package:weatherapp_zeoptic/utils/helper.dart';

class Temperature extends StatelessWidget {
  const Temperature({
    super.key,
    required this.temp,
  });

  final WeatherCurrentModel temp;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(MyAppConstants.icons[
              temp.weather[0].main]),
          height: 120,
          width: 120,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 10,
        ),
        BlocBuilder<ToggleCubit, bool>(
          builder: (context, isFaranheitt) {
            final double displayTemp = isFaranheitt
                ? Helper().convertToFahrenheit(temp.main.temp)
                : temp.main.temp;
            return Text(
                isFaranheitt
                    ? '${displayTemp.toStringAsFixed(0)}\u00B0 F'
                    : '${displayTemp.toStringAsFixed(0)}\u00B0 C',
                style: MyAppTextStyles.mainTemperature);
          },
        )
      ],
    );
  }
}
