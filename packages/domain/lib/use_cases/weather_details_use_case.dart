import 'dart:async';

import 'package:domain/domain.dart';
import 'package:domain/entities/entities.dart';

import '../repositories/open_weather_repository.dart';

class WeatherDetailsUseCase {
  final OpenWeatherRepository _openWeatherRepository;

  WeatherDetailsUseCase(this._openWeatherRepository);

  FutureOr<WeatherData> getWeatherDetails({
    required double lat,
    required double lon,
  }) async {
    final forecastData = await _openWeatherRepository.fetchWeatherDetails(
      lat: lat,
      lon: lon,
    );
    return forecastData.toWeatherData();
  }
}
