import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:weather_app/enums/enums.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc(this._weatherDetailsUseCase) : super(HomeScreenInitial()) {
    on<SwitchTemperatureUnit>(_switchTemperatureUnit);
    on<GetForecastData>(_getForecastData);
    on<SelectForecastDay>(_selectForecastDay);
    on<RefreshForecastData>(_refreshForecastData);
  }

  final WeatherDetailsUseCase _weatherDetailsUseCase;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  RefreshController get refreshController => _refreshController;

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

  void _selectForecastDay(
    SelectForecastDay event,
    Emitter<HomeScreenState> emit,
  ) {
    if (state is HomeScreenLoadedState) {
      final HomeScreenLoadedState currentState = state as HomeScreenLoadedState;
      emit(
        currentState.copyWith(
          weatherData: currentState.weatherData.copyWith(
            current: event.weather,
          ),
        ),
      );
    }
  }

  void _refreshForecastData(
    RefreshForecastData event,
    Emitter<HomeScreenState> emit,
  ) async {
    try {
      final weatherDetails = await _weatherDetailsUseCase.getWeatherDetails(
        lat: 52.4633188,
        lon: 13.3405259,
      );
      _refreshController.refreshCompleted();
      emit(
        HomeScreenLoadedState(
          weatherDetails,
        ),
      );
    } catch (_) {
      _refreshController.refreshFailed();
    }
  }
}
