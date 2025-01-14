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

      // Converting forecast data to weather data to remove hourly forecast data.
      final weatherData = forecastData.toWeatherData();

      final List<Weather> sortedForecast = [];
      sortedForecast.add(weatherData.current);

      // The forecast data is sorted hourly in ascending order.
      // Pick first value of forecast data stored in current variable.
      DateTime dateTime = weatherData.current.dateTime;

      // Removing hourly forecast data
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

      // Updating weather data with sorted forecast data.
      return weatherData.copyWith(forecast: sortedForecast);
    } catch (exception) {
      throw (exception as WeatherAppExceptions).message;
    }
  }
}
