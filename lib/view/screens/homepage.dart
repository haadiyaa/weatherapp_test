import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp_zeoptic/blocs/loctionbloc/location_bloc.dart';
import 'package:weatherapp_zeoptic/blocs/togglecubit/toggle_cubit.dart';
import 'package:weatherapp_zeoptic/blocs/weatherbloc/weather_bloc.dart';
import 'package:weatherapp_zeoptic/utils/appcolors.dart.dart';
import 'package:weatherapp_zeoptic/utils/appconstants.dart';
import 'package:weatherapp_zeoptic/utils/appdimensions.dart';
import 'package:weatherapp_zeoptic/utils/apptextstyles.dart';
import 'package:weatherapp_zeoptic/utils/helper.dart';
import 'package:weatherapp_zeoptic/view/widgets/buildglasscard.dart';
import 'package:weatherapp_zeoptic/view/widgets/celcius%20tofarenheit.dart';
import 'package:weatherapp_zeoptic/view/widgets/description.dart';
import 'package:weatherapp_zeoptic/view/widgets/loaders/forecastshimmer.dart';
import 'package:weatherapp_zeoptic/view/widgets/loaders/todaytomorrowshimmer.dart';
import 'package:weatherapp_zeoptic/view/widgets/locationwidget.dart';
import 'package:weatherapp_zeoptic/view/widgets/searchbar.dart';
import 'package:weatherapp_zeoptic/view/widgets/temperature.dart';
import 'package:weatherapp_zeoptic/view/widgets/valuestile.dart';

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
              MySearchBar(size: size, locationText: locationText),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state.weather==Weather.current) {
                    final temp = state.weatherCurrentModel!;

                    return Temperature(temp: temp);
                  }
                  if (state.weather==Weather.search) {
                    final temp = state.searchCurrentWeather!;

                    return Temperature(temp: temp);
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
                  if (state.weather==Weather.current) {
                    final desc = state.weatherCurrentModel!;
                    return Description(desc: desc);
                  }
                  if (state.weather==Weather.search) {
                    final desc = state.searchCurrentWeather!;
                    return Description(desc: desc);
                  }
                  return const Text(
                    '_ _ _ -_ _ _ _',
                    style: MyAppTextStyles.subtitle,
                  );
                },
              ),
              BlocBuilder<ToggleCubit, bool>(
                builder: (context, isFaranheitt) {
                  return CelciusToFaren(
                    isFaranheitt: isFaranheitt,
                  );
                },
              ),
              const SizedBox(
                height: 40,
              ),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state.weather==Weather.current) {
                    final data = state.weatherCurrentModel!;
                    return ValuesTile(size: size, data: data);
                  }
                  if (state.weather==Weather.search) {
                    final data = state.searchCurrentWeather!;
                    return ValuesTile(size: size, data: data);
                  }
                  return TodayTomorrw(size: size);
                },
              ),
              const SizedBox(height: 40),
              BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  if (state.weatherModel != null) {
                    final model = state.weatherModel;
                    List weather = [];
                    DateTime now = DateTime.now();
                    for (var i in model!.list) {
                      DateTime parsedDate = DateTime.parse(i.dtTxt);

                      if (parsedDate.year == now.year &&
                          parsedDate.month == now.month &&
                          parsedDate.day == now.day) {
                        weather.add(i);
                      }
                    }
                    print(weather);
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
                            itemCount: weather.length,
                            itemBuilder: (context, index) => BuildGlassCard(
                              time: Helper().formatTo12Hour(
                                  weather[index].dtTxt.toString()),
                              temp:
                                  '${weather[index].main.temp.toStringAsFixed(0)}\u00B0',
                              icon: MyAppConstants
                                  .icons[weather[index].weather[0].main],
                            ),
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ],
                    );
                  }
                  return const ForecastShimmer();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
