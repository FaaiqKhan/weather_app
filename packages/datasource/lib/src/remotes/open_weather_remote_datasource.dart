import 'dart:async';

import 'package:datasource/src/models/models.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

abstract interface class OpenWeatherRemoteDatasource {
  factory OpenWeatherRemoteDatasource({Dio? dioClient}) =>
      OpenWeatherRemoteDatasourceImpl(
        dioClient: dioClient,
      );

  FutureOr<ForecastData> fetchWeatherDetails({
    required double lat,
    required double lon,
  });
}

class OpenWeatherRemoteDatasourceImpl implements OpenWeatherRemoteDatasource {
  OpenWeatherRemoteDatasourceImpl({Dio? dioClient})
      : _dioClient = dioClient ??
            Dio(
              BaseOptions(
                baseUrl: "https://api.openweathermap.org/data/2.5/",
              ),
            );

  final Dio _dioClient;

  @override
  FutureOr<ForecastData> fetchWeatherDetails({
    required double lat,
    required double lon,
  }) async {
    try {
      const apiKey = String.fromEnvironment("open-weather-api-key");
      final response = await _dioClient.get(
        "forecast?lat=$lat&lon=$lon&units=imperial&appid=",
      );
      if (response.statusCode == 200) {
        return ForecastData.fromJson(response.data);
      }
    } catch (exception) {
      if (exception is DioException) {
        if (exception.response?.statusCode == 401) {
          throw UnauthorizedException();
        }
      }
    }
    throw GeneralException();
  }
}
