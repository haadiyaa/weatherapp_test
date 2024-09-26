
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp_zeoptic/blocs/loctionbloc/location_bloc.dart';
import 'package:weatherapp_zeoptic/blocs/weatherbloc/weather_bloc.dart';
import 'package:weatherapp_zeoptic/utils/appcolors.dart.dart';
import 'package:weatherapp_zeoptic/utils/apptextstyles.dart';

class LocationWidget extends StatelessWidget {
  LocationWidget({
    super.key,
  });
  final TextEditingController locationText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        if (state.country != null) {
          BlocProvider.of<WeatherBloc>(context)
              .add(FetchCurrentWeather(city: state.country!));
          BlocProvider.of<WeatherBloc>(context)
              .add(FetchForecastWeather(city: state.country!));
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Current Location'),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: MyAppColors.forecastText,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    state.country!,
                    style: MyAppTextStyles.subtitle.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          );
        }
        return Text(
          'Please wait...',
          style: MyAppTextStyles.subtitle.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}
