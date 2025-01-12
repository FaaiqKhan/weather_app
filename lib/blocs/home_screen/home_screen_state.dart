part of 'home_screen_bloc.dart';

sealed class HomeScreenState extends Equatable {
  const HomeScreenState();
}

final class HomeScreenInitial extends HomeScreenState {
  @override
  List<Object> get props => [];
}

final class HomeScreenLoadingState extends HomeScreenState {
  @override
  List<Object?> get props => [];
}

final class HomeScreenLoadedState extends HomeScreenState {
  final WeatherData weatherData;
  final TemperatureUnit? unit;

  const HomeScreenLoadedState(
    this.weatherData, {
    this.unit = TemperatureUnit.fahrenheit,
  });

  HomeScreenLoadedState copyWith({
    WeatherData? weatherData,
    TemperatureUnit? unit,
  }) {
    return HomeScreenLoadedState(
      weatherData ?? this.weatherData,
      unit: unit ?? this.unit,
    );
  }

  @override
  List<Object?> get props => [weatherData, unit];
}

final class HomeScreenErrorState extends HomeScreenState {
  final String errorMessage;

  const HomeScreenErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
