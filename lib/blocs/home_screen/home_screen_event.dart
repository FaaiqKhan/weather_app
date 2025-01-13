part of 'home_screen_bloc.dart';

sealed class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();
}

final class SwitchTemperatureUnit extends HomeScreenEvent {
  final TemperatureUnit temperatureUnit;

  const SwitchTemperatureUnit(this.temperatureUnit);

  @override
  List<Object?> get props => [temperatureUnit];
}

final class GetForecastData extends HomeScreenEvent {
  @override
  List<Object?> get props => [];
}

final class SelectForecastDay extends HomeScreenEvent {
  final Weather weather;

  const SelectForecastDay(this.weather);

  @override
  List<Object?> get props => [weather];
}

final class RefreshForecastData extends HomeScreenEvent {
  @override
  List<Object?> get props => [];
}