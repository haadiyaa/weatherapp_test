part of 'weather_bloc.dart';

class WeatherState {
  final WeatherCurrentModel? weatherCurrentModel;
  final WeatherCurrentModel? searchCurrentWeather;
  final ForecastWeatherModel? weatherModel;
  final String? location;

  WeatherState({this.weatherCurrentModel, this.weatherModel,this.searchCurrentWeather,this.location});

  WeatherState copyWith({
    WeatherCurrentModel? weatherCurrentModel,
    ForecastWeatherModel? weatherModel,
    WeatherCurrentModel? searchCurrentWeather,
  String? location,
  }) {
    return WeatherState(
      weatherCurrentModel: weatherCurrentModel ?? this.weatherCurrentModel,
      weatherModel: weatherModel ?? this.weatherModel,
      searchCurrentWeather: searchCurrentWeather ?? this.searchCurrentWeather,
      location: location??this.location,
    );
  }
}

// final class WeatherInitial extends WeatherState {}
