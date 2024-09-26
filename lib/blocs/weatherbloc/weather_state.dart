part of 'weather_bloc.dart';

enum Weather { search, current, inittial }

class WeatherState {
  final Weather weather;
  final WeatherCurrentModel? weatherCurrentModel;
  final WeatherCurrentModel? searchCurrentWeather;
  final ForecastWeatherModel? weatherModel;
  final String? location;

  WeatherState({
    this.weatherCurrentModel,
    this.weatherModel,
    this.searchCurrentWeather,
    this.location,
    this.weather = Weather.inittial,
  });

  WeatherState copyWith({
    WeatherCurrentModel? weatherCurrentModel,
    ForecastWeatherModel? weatherModel,
    WeatherCurrentModel? searchCurrentWeather,
    String? location,
    Weather? weather,
  }) {
    return WeatherState(
      weatherCurrentModel: weatherCurrentModel ?? this.weatherCurrentModel,
      weatherModel: weatherModel ?? this.weatherModel,
      searchCurrentWeather: searchCurrentWeather ?? this.searchCurrentWeather,
      location: location ?? this.location,
      weather: weather??this.weather,
    );
  }
}

class WeatherCurrentState extends WeatherState {
  WeatherCurrentState({super.weatherCurrentModel});
}

class SearchCurrentState extends WeatherState {
  SearchCurrentState({super.searchCurrentWeather});
}
