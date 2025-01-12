import 'dart:async';

import 'package:data/data.dart';
import 'package:data/datasource/remotes/open_weather_remote_datasource.dart';

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
