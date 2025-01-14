import 'dart:async';

import 'package:domain/domain.dart';

class WeatherDetailsUseCase {
  final OpenWeatherRepository _openWeatherRepository;

  WeatherDetailsUseCase(this._openWeatherRepository);

  FutureOr<WeatherData> getWeatherDetails({
    required double lat,
    required double lon,
  }) async {
    try {
      final forecastData = await _openWeatherRepository.fetchWeatherDetails(
        lat: lat,
        lon: lon,
      );

      final weatherData = forecastData.toWeatherData();

      final List<Weather> sortedForecast = [];
      sortedForecast.add(weatherData.current);

      DateTime dateTime = weatherData.current.dateTime;

      for (var forecast in weatherData.forecast) {
        final forecastDateTime = forecast.dateTime;
        if (forecastDateTime.day == dateTime.day &&
            forecastDateTime.month == dateTime.month &&
            forecastDateTime.year == dateTime.year) {
          continue;
        }
        sortedForecast.add(forecast);
        dateTime = forecastDateTime;
      }

      return weatherData.copyWith(forecast: sortedForecast);
    } catch(exception) {
      rethrow;
    }
  }
}
