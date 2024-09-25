part of 'weather_bloc.dart';

class WeatherState {
  final WeatherCurrentModel? weatherCurrentModel;
  final WeatherModel? weatherModel;

  WeatherState({this.weatherCurrentModel, this.weatherModel});

  WeatherState copyWith({
    WeatherCurrentModel? weatherCurrentModel,
    WeatherModel? weatherModel,
  }) {
    return WeatherState(
      weatherCurrentModel: weatherCurrentModel ?? this.weatherCurrentModel,
      weatherModel: weatherModel ?? this.weatherModel,
    );
  }
}

// final class WeatherInitial extends WeatherState {}
