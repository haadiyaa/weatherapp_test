import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:weatherapp_zeoptic/utils/helper.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  Position? _currentPosition;
  Placemark? _currenLocationName;
  String? _country;
  final Helper _locationService = Helper();
  LocationBloc() : super(LocationState()) {
    on<FetchLocationEvent>(_fetchLocation);
  }

  Future<void> _fetchLocation(FetchLocationEvent event, Emitter<LocationState> emit) async {
    print('hello');
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _currentPosition = null;
      
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        _currentPosition == null;
        
      }
    }
    if (permission == LocationPermission.deniedForever) {
      _currentPosition = null;
      
    }
    _currentPosition = await Geolocator.getCurrentPosition();
    print('CURRENT POSITION : $_currentPosition');

    _country=await _locationService.getLocationName(_currentPosition);
    print('CURRENT LOCATION NAME: $_currenLocationName');    
    print('CURRENT countr NAME: $_country');    
    emit(LocationState(country: _country));
  }
}
