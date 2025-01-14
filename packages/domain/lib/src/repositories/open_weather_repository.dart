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
