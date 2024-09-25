part of 'weather_bloc.dart';

class WeatherEvent {}

class FetchCurrentWeather extends WeatherEvent {
  final String city;

  FetchCurrentWeather({required this.city});
}
