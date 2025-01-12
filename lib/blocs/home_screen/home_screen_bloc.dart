import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:domain/entities/entities.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/enums/enums.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc(this._weatherDetailsUseCase) : super(HomeScreenInitial()) {
    on<SwitchTemperatureUnit>(_switchTemperatureUnit);
    on<GetForecastData>(_getForecastData);
  }

  final WeatherDetailsUseCase _weatherDetailsUseCase;

  void _switchTemperatureUnit(
    SwitchTemperatureUnit event,
    Emitter<HomeScreenState> emit,
  ) {
    if (state is HomeScreenLoadedState) {
      final HomeScreenLoadedState currentState = state as HomeScreenLoadedState;
      emit(
        currentState.copyWith(
          unit: event.temperatureUnit,
        ),
      );
    }
  }

  void _getForecastData(
    GetForecastData event,
    Emitter<HomeScreenState> emit,
  ) async {
    emit(
      HomeScreenLoadingState(),
    );
    try {
      final weatherDetails = await _weatherDetailsUseCase.getWeatherDetails(
        lat: 52.4633188,
        lon: 13.3405259,
      );
      print(weatherDetails);
      emit(
        HomeScreenLoadedState(
          weatherDetails,
        ),
      );
    } catch (exception) {
      emit(
        HomeScreenErrorState(
          exception.toString(),
        ),
      );
    }
  }
}
