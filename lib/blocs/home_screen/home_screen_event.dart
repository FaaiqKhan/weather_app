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
