part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();
  
  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
  
  @override
  List<Object> get props => [];
}

class WeatherLoading extends WeatherState {
  const WeatherLoading();
  
  @override
  List<Object> get props => [];
}

class WeatherLoaded extends WeatherState {
  final Weather weather;
  const WeatherLoaded(this.weather);
  
  @override
  List<Object> get props => [weather];
}

class WeatherError extends WeatherState {
  final String errorMessage;
  const WeatherError(this.errorMessage);
  
  @override
  List<Object> get props => [errorMessage];
}