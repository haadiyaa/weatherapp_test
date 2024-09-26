part of 'weather_bloc.dart';

class WeatherEvent {}

class FetchCurrentWeather extends WeatherEvent {
  final String city;

  FetchCurrentWeather({required this.city});
}

class FetchForecastWeather extends WeatherEvent {
  final String city;

  FetchForecastWeather({required this.city});
}

// class SearchCurrentWeather extends WeatherEvent {
//   final String city;

//   SearchCurrentWeather({required this.city});
// }