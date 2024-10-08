import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weatherapp_zeoptic/model/weathercurrentmodel.dart';
import 'package:weatherapp_zeoptic/model/weathermodel.dart';
import 'package:weatherapp_zeoptic/utils/secrets.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherState()) {
    on<FetchCurrentWeather>(_currentLocation);
    on<FetchForecastWeather>(_fetchForecast);
    on<SearchCurrentWeather>(_searchLocation);
  }

  Future<void> _currentLocation(
      FetchCurrentWeather event, Emitter<WeatherState> emit) async {
    WeatherCurrentModel? weather;
    try {
      final apiUrl =
          "${Secrets.baseUrlCurrent}${Secrets.city}${event.city}&appid=${Secrets.apiKey}&units=metric";
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('DATA : $data');
        print('data fetched');
        weather = WeatherCurrentModel.fromJson(data);
        print('WEATHER : ${weather!.main!.temp}');
        emit(state.copyWith(weatherCurrentModel: weather,weather: Weather.current));
      } else {
        print('_error');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _searchLocation(SearchCurrentWeather event, Emitter<WeatherState> emit) async {
    WeatherCurrentModel? _weather;
    try {
      final apiUrl =
          "${Secrets.baseUrlCurrent}${Secrets.city}${event.city}&appid=${Secrets.apiKey}&units=metric";
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('DATA : $data');
        print('data fetched');

        _weather = WeatherCurrentModel.fromJson(data);
        print('WEATHER : ${_weather!.main!.temp}');
        emit(state.copyWith(searchCurrentWeather: _weather,weather: Weather.search));
      } else {
        print('_error');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _fetchForecast(FetchForecastWeather event, Emitter<WeatherState> emit) async {
    ForecastWeatherModel? weather;
    try {
      final apiUrl =
          "${Secrets.baseUrl3hr}${Secrets.city}${event.city}&appid=${Secrets.apiKey}&units=metric";
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('DATA : $data');
        print('data fetched');
        weather = ForecastWeatherModel.fromMap(data);
        print('city : ${weather.city.name}');
        emit(state.copyWith(weatherModel: weather));
      } else {
        print('_error');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
