import 'package:datasource/datasource.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'datasource_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late OpenWeatherRemoteDatasource remoteDatasource;

  setUp(() {
    mockDio = MockDio();
    remoteDatasource = OpenWeatherRemoteDatasource(
      dioClient: mockDio,
    );
  });

  group("fetchWeatherDetails", () {
    final lat = 37.7749;
    final lon = -122.4194;
    final apiKey = String.fromEnvironment("open-weather-api-key");

    // Successful response
    test("should return ForecastData on success", () async {
      when(
        mockDio.get("forecast?lat=$lat&lon=$lon&units=imperial&appid=$apiKey"),
      ).thenAnswer((_) async {
        return Response(
          requestOptions: RequestOptions(),
          statusCode: 200,
          data: {
            "cod": "200",
            "message": 0,
            "cnt": 40,
            "list": [
              {
                "dt": 1661871600,
                "main": {
                  "temp": 296.76,
                  "feels_like": 296.98,
                  "temp_min": 296.76,
                  "temp_max": 297.87,
                  "pressure": 1015,
                  "sea_level": 1015,
                  "grnd_level": 933,
                  "humidity": 69,
                  "temp_kf": -1.11
                },
                "weather": [
                  {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10d"
                  }
                ],
                "clouds": {"all": 100},
                "wind": {"speed": 0.62, "deg": 349, "gust": 1.18},
                "visibility": 10000,
                "pop": 0.32,
                "rain": {"3h": 0.26},
                "sys": {"pod": "d"},
                "dt_txt": "2022-08-30 15:00:00"
              },
              {
                "dt": 1661882400,
                "main": {
                  "temp": 295.45,
                  "feels_like": 295.59,
                  "temp_min": 292.84,
                  "temp_max": 295.45,
                  "pressure": 1015,
                  "sea_level": 1015,
                  "grnd_level": 931,
                  "humidity": 71,
                  "temp_kf": 2.61
                },
                "weather": [
                  {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10n"
                  }
                ],
                "clouds": {"all": 96},
                "wind": {"speed": 1.97, "deg": 157, "gust": 3.39},
                "visibility": 10000,
                "pop": 0.33,
                "rain": {"3h": 0.57},
                "sys": {"pod": "n"},
                "dt_txt": "2022-08-30 18:00:00"
              },
              {
                "dt": 1661893200,
                "main": {
                  "temp": 292.46,
                  "feels_like": 292.54,
                  "temp_min": 290.31,
                  "temp_max": 292.46,
                  "pressure": 1015,
                  "sea_level": 1015,
                  "grnd_level": 931,
                  "humidity": 80,
                  "temp_kf": 2.15
                },
                "weather": [
                  {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10n"
                  }
                ],
                "clouds": {"all": 68},
                "wind": {"speed": 2.66, "deg": 210, "gust": 3.58},
                "visibility": 10000,
                "pop": 0.7,
                "rain": {"3h": 0.49},
                "sys": {"pod": "n"},
                "dt_txt": "2022-08-30 21:00:00"
              },
              {
                "dt": 1662292800,
                "main": {
                  "temp": 294.93,
                  "feels_like": 294.83,
                  "temp_min": 294.93,
                  "temp_max": 294.93,
                  "pressure": 1018,
                  "sea_level": 1018,
                  "grnd_level": 935,
                  "humidity": 64,
                  "temp_kf": 0
                },
                "weather": [
                  {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                  }
                ],
                "clouds": {"all": 88},
                "wind": {"speed": 1.14, "deg": 17, "gust": 1.57},
                "visibility": 10000,
                "pop": 0,
                "sys": {"pod": "d"},
                "dt_txt": "2022-09-04 12:00:00"
              }
            ],
            "city": {
              "id": 3163858,
              "name": "Zocca",
              "coord": {"lat": 44.34, "lon": 10.99},
              "country": "IT",
              "population": 4593,
              "timezone": 7200,
              "sunrise": 1661834187,
              "sunset": 1661882248
            }
          },
        );
      });

      final response = await remoteDatasource.fetchWeatherDetails(
        lat: lat,
        lon: lon,
      );

      expect(response, isA<ForecastData>());
      expect(response.list!.first.weatherDetails!.temp, 296.76);
      expect(response.list!.first.weather!.first.description, "light rain");
    });

    // Unauthorized exception
    test("should throw UnauthorizedException when API key is invalid",
        () async {
      when(
        mockDio.get("forecast?lat=$lat&lon=$lon&units=imperial&appid="),
      ).thenThrow(
        DioException(
          requestOptions: RequestOptions(),
          response: Response(
            requestOptions: RequestOptions(),
            statusCode: 401,
          ),
        ),
      );

      late final Exception unauthorizedException;
      try {
        await remoteDatasource.fetchWeatherDetails(
          lat: lat,
          lon: lon,
        );
      } catch (exception) {
        unauthorizedException = exception as Exception;
      }

      expect(unauthorizedException, isA<UnauthorizedException>());
    });

    // General exception
    test("should throw GeneralException for any other reason", () async {
      when(
        mockDio.get("forecast?lat=$lat&lon=$lon&units=imperial&appid=$apiKey"),
      ).thenThrow(
        DioException(
          requestOptions: RequestOptions(),
          response: Response(
            requestOptions: RequestOptions(),
            statusCode: 500,
          ),
        ),
      );

      late final Exception generalException;
      try {
        await remoteDatasource.fetchWeatherDetails(
          lat: lat,
          lon: lon,
        );
      } catch (exception) {
        generalException = exception as Exception;
      }

      expect(generalException, isA<GeneralException>());
    });
  });
}
