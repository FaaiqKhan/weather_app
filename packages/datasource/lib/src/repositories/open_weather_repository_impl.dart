import 'dart:async';

import 'package:datasource/src/models/forecast_data.dart';
import 'package:datasource/src/remotes/open_weather_remote_datasource.dart';
import 'package:domain/domain.dart';

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
