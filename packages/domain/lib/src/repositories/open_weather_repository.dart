import 'dart:async';

import 'package:datasource/datasource.dart';

abstract interface class OpenWeatherRepository {
  factory OpenWeatherRepository({
    OpenWeatherRemoteDatasource? remoteDatasource,
  }) =>
      OpenWeatherRepositoryImpl(
        remoteDatasource ?? OpenWeatherRemoteDatasource(),
      );

  FutureOr<ForecastData> fetchWeatherDetails({
    required double lat,
    required double lon,
  });
}

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
