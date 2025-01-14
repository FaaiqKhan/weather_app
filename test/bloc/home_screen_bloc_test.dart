import 'package:bloc_test/bloc_test.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app/blocs/home_screen/home_screen_bloc.dart';
import 'package:weather_app/enums/enums.dart';

import 'home_screen_bloc_test.mocks.dart';

@GenerateMocks([WeatherDetailsUseCase])
void main() {
  late HomeScreenBloc homeScreenBloc;
  late MockWeatherDetailsUseCase mockWeatherDetailsUseCase;

  setUp(() {
    mockWeatherDetailsUseCase = MockWeatherDetailsUseCase();
    homeScreenBloc = HomeScreenBloc(mockWeatherDetailsUseCase);
  });

  tearDown(() {
    homeScreenBloc.close();
  });

  group("HomeScreenBloc Tests", () {
    // Mock Data
    final weather = Weather(
      id: 500,
      icon: "10n",
      tempInFahrenheit: "32°F",
      tempInCelsius: "0°C",
      tempMinInFahrenheit: "28°F",
      tempMinInCelsius: "-4°C",
      tempMaxInFahrenheit: "38°F",
      tempMaxInCelsius: "2°C",
      pressure: "1038 hPa",
      humidity: "64%",
      windSpeed: "18 km/h",
      description: "Cloudy",
      dateTime: DateTime(2025, 1, 1),
    );
    final weatherData = WeatherData(
      city: City(
        id: 1,
        name: "Zocca",
        country: "IT",
        sunrise: 1661834187,
        sunset: 1661882248,
      ),
      current: weather,
      forecast: [
        weather.copyWith(
          dateTime: DateTime(2025, 1, 2),
        ),
        weather.copyWith(
          dateTime: DateTime(2025, 1, 3),
        ),
        weather.copyWith(
          dateTime: DateTime(2025, 1, 4),
        ),
        weather.copyWith(
          dateTime: DateTime(2025, 1, 5),
        ),
        weather.copyWith(
          dateTime: DateTime(2025, 1, 6),
        ),
      ],
    );

    test("Initial state is HomeScreenInitial", () {
      expect(homeScreenBloc.state, HomeScreenInitial());
    });

    blocTest<HomeScreenBloc, HomeScreenState>(
      "emits [HomeScreenLoadingState, HomeScreenLoadedState] when GetForecastData succeeds",
      setUp: () {
        when(mockWeatherDetailsUseCase.getWeatherDetails(
          lat: 52.4633188,
          lon: 13.3405259,
        )).thenAnswer((_) async => weatherData);
      },
      build: () => homeScreenBloc,
      act: (bloc) => bloc.add(GetForecastData()),
      expect: () => [
        HomeScreenLoadingState(),
        HomeScreenLoadedState(weatherData),
      ],
      verify: (_) {
        verify(mockWeatherDetailsUseCase.getWeatherDetails(
          lat: 52.4633188,
          lon: 13.3405259,
        )).called(1);
      },
    );

    blocTest<HomeScreenBloc, HomeScreenState>(
      "emits [HomeScreenLoadingState, HomeScreenErrorState] when GetForecastData fails",
      setUp: () {
        when(mockWeatherDetailsUseCase.getWeatherDetails(
          lat: 52.4633188,
          lon: 13.3405259,
        )).thenThrow("Failed to fetch data");
      },
      build: () => homeScreenBloc,
      act: (bloc) => bloc.add(GetForecastData()),
      expect: () => [
        HomeScreenLoadingState(),
        HomeScreenErrorState("Failed to fetch data"),
      ],
    );

    blocTest<HomeScreenBloc, HomeScreenState>(
      "emits updated state when SwitchTemperatureUnit is called",
      build: () => homeScreenBloc,
      seed: () => HomeScreenLoadedState(
        weatherData,
        unit: TemperatureUnit.celsius,
      ),
      act: (bloc) =>
          bloc.add(SwitchTemperatureUnit(TemperatureUnit.fahrenheit)),
      expect: () => [
        HomeScreenLoadedState(
          weatherData,
          unit: TemperatureUnit.fahrenheit,
        ),
      ],
    );

    blocTest<HomeScreenBloc, HomeScreenState>(
      "updates the selected weather day when SelectForecastDay is called",
      build: () => homeScreenBloc,
      seed: () => HomeScreenLoadedState(weatherData),
      act: (bloc) => bloc.add(SelectForecastDay(weatherData.forecast.last)),
      expect: () => [
        isA<HomeScreenLoadedState>().having(
          (state) => state.weatherData.current,
          "Updated state",
          weatherData.forecast.last,
        )
      ],
    );

    blocTest<HomeScreenBloc, HomeScreenState>(
      "refreshes data and emits new state when RefreshForecastData is called",
      setUp: () {
        when(mockWeatherDetailsUseCase.getWeatherDetails(
          lat: 52.4633188,
          lon: 13.3405259,
        )).thenAnswer((_) async => weatherData);
      },
      build: () => homeScreenBloc,
      act: (bloc) => bloc.add(RefreshForecastData()),
      expect: () => [
        HomeScreenLoadedState(weatherData),
      ],
      verify: (_) {
        expect(homeScreenBloc.refreshController.isRefresh, isFalse);
      },
    );
  });
}
