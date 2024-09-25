// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'location_bloc.dart';

class LocationState {
  final String? country;

  LocationState({this.country});

  LocationState copyWith({
    String? country,
  }) {
    return LocationState(
      country: country ?? this.country,
    );
  }
 }

// final class LocationInitial extends LocationState {}
// class LocationFetchedState extends LocationState{}