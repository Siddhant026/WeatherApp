import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:reso_bloc1/models/weather_model.dart';
import 'package:reso_bloc1/repositories/weather_repo.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final weatherRepository = WeatherRepository();
  WeatherBloc(WeatherRepository weatherRepository) : super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    yield WeatherLoading();
    if (event is GetWeather) {
      try {
        final weather = await weatherRepository.getWeather(event.city);
        yield WeatherLoaded(weather);
      } on Exception {
        yield WeatherError("Couldn't fetch weather. Is the device online?");
      }
    }
  }
}
