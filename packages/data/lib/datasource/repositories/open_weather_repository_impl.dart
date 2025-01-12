import 'dart:async';

import 'package:data/datasource/remotes/open_weather_remote_datasource.dart';
import 'package:domain/repositories/open_weather_repository.dart';

import '../models/models.dart';

class OpenWeatherRepositoryImpl implements OpenWeatherRepository {
  final OpenWeatherRemoteDatasource datasource;

  OpenWeatherRepositoryImpl(this.datasource);

  @override
  FutureOr<ForecastData> fetchWeatherDetails({
    required double lat,
    required double lon,
  }) async {
    try {
      return await datasource.fetchWeatherDetails(
        lat: lat,
        lon: lon,
      );
    } catch (_) {
      rethrow;
    }
  }
}
