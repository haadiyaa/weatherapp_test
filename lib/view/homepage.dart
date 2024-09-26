import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp_zeoptic/blocs/loctionbloc/location_bloc.dart';
import 'package:weatherapp_zeoptic/blocs/togglecubit/toggle_cubit.dart';
import 'package:weatherapp_zeoptic/blocs/weatherbloc/weather_bloc.dart';
import 'package:weatherapp_zeoptic/main.dart';
import 'package:weatherapp_zeoptic/model/weathercurrentmodel.dart';
import 'package:weatherapp_zeoptic/utils/appcolors.dart.dart';
import 'package:weatherapp_zeoptic/utils/appconstants.dart';
import 'package:weatherapp_zeoptic/utils/appdimensions.dart';
import 'package:weatherapp_zeoptic/utils/apptextstyles.dart';
import 'package:weatherapp_zeoptic/utils/helper.dart';
import 'package:weatherapp_zeoptic/view/widgets/froastedglassbox.dart';

class HomePageWrapper extends StatelessWidget {
  const HomePageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocationBloc(),
        ),
        BlocProvider(
          create: (context) => WeatherBloc(),
        ),
        BlocProvider(
          create: (context) => ToggleCubit(),
        ),
      ],
      child: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<LocationBloc>(context).add(FetchLocationEvent());
  }

  final TextEditingController locationText = TextEditingController();
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
              LocationWidget(),
              // TextField(
              //   onTapOutside: (event) => FocusScope.of(context).unfocus(),
              //   style: MyAppTextStyles.subtitle.copyWith(
              //     fontSize: 28,
              //     fontWeight: FontWeight.bold,
              //   ),
              //   onTap: (){print('tapped');},
              //   controller: locationText,
              //   decoration: InputDecoration(
              //     contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              //     labelStyle: MyAppTextStyles.subtitle,
              //     labelText: 'Search by City',
              //     suffixIcon: IconButton(
              //       onPressed: () {
              //         print('searched');
              //         // FocusScope.of(context).unfocus();
              //         BlocProvider.of<WeatherBloc>(context).add(FetchCurrentWeather(city: locationText.text));
              //         locationText.clear();
              //       },
              //       icon: const Icon(Icons.search),
              //       color: MyAppColors.forecastText,
              //     ),
              //     enabledBorder:
              //         const OutlineInputBorder(borderSide: BorderSide.none),
              //     focusedBorder: const UnderlineInputBorder(
              //       borderSide: BorderSide(color: MyAppColors.forecastText),
              //     ),
              //   ),
              // ),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state.weatherCurrentModel != null) {
                    final temp = state.weatherCurrentModel!.main.temp;

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(MyAppConstants.icons[
                              state.weatherCurrentModel!.weather[0].main]),
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        BlocBuilder<ToggleCubit, bool>(
                          builder: (context, isFaranheitt) {
                            final displayTemp = isFaranheitt
                                ? Helper().convertToFahrenheit(temp)
                                : temp;
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
                  return const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.cloud, color: Colors.white, size: 100),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('...° C', style: MyAppTextStyles.mainTemperature),
                    ],
                  );
                },
              ),
              const SizedBox(height: 5),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state.weatherCurrentModel != null) {
                    final desc = state.weatherCurrentModel!.weather[0];
                    return Column(
                      children: [
                        Text(
                          state.weatherCurrentModel!.name,
                          style: MyAppTextStyles.subtitle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${desc.main.toUpperCase()} - ${desc.description.toUpperCase()}',
                          style: MyAppTextStyles.subtitle,
                        ),
                      ],
                    );
                  }
                  return const Text(
                    '_ _ _ -_ _ _ _',
                    style: MyAppTextStyles.subtitle,
                  );
                },
              ),
              BlocBuilder<ToggleCubit, bool>(
                builder: (context, isFaranheitt) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Celsius"),
                      Switch(
                        trackOutlineColor: MaterialStateProperty.all(MyAppColors.transparent),
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
                },
              ),
              const SizedBox(
                height: 40,
              ),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state.weatherCurrentModel != null) {
                    final data = state.weatherCurrentModel!;
                    return ValuesTile(size: size, data: data);
                  }
                  return FrostedGlassBox(
                    width: size.width * 0.9,
                    height: size.height * 0.12,
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Sunset', style: MyAppTextStyles.cardTitle),
                            SizedBox(height: 8),
                            Text('5:51PM', style: MyAppTextStyles.cardValue),
                          ],
                        ),
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
                  );
                },
              ),
              const SizedBox(height: 40),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state.weatherModel != null) {
                    final model = state.weatherModel;
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                                decoration: BoxDecoration(
                                  color: MyAppColors.buttonUnselected,
                                  borderRadius: BorderRadius.circular(30),
                                ),
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
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            itemCount: model!.list.length,
                            itemBuilder: (context, index) =>
                                _buildGlassForecastCard(
                                    Helper().formatTo12Hour(
                                        model.list[index].dtTxt.toString()),
                                    '${model.list[index].main.temp.toStringAsFixed(0)}\u00B0',
                                    MyAppConstants.icons[
                                        model.list[index].weather[0].main]),
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ],
                    );
                  }
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                              decoration: BoxDecoration(
                                color: MyAppColors.buttonUnselected,
                                borderRadius: BorderRadius.circular(30),
                              ),
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
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 100,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            _buildGlassForecastCard(
                                'Now', '13°', MyAppConstants.icons['Rain']),
                            _buildGlassForecastCard(
                                '4PM', '14°', MyAppConstants.icons['Rain']),
                            _buildGlassForecastCard(
                                '5PM', '12°', MyAppConstants.icons['Rain']),
                            _buildGlassForecastCard(
                                '6PM', '8°', MyAppConstants.icons['Rain']),
                            _buildGlassForecastCard(
                                '7PM', '9°', MyAppConstants.icons['Rain']),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGlassForecastCard(String time, String temp, String icon) {
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
                  Text(time,
                      style: MyAppTextStyles.subtitle.copyWith(fontSize: 14)),
                  // Icon(icon,
                  //     size: MyAppDimensions.forecastIconSize,
                  //     color: Colors.white),
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
