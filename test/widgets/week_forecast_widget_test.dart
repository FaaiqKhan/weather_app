import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:weather_app/enums/enums.dart';
import 'package:weather_app/widgets/brief_weather_widget.dart';
import 'package:weather_app/widgets/week_forecast_widget.dart';

void main() {
  group("WeekForecastWidget", () {
    final Weather weather = Weather(
      id: 1,
      icon: "https://example.com/10nd@2x.png",
      tempInFahrenheit: "35",
      tempInCelsius: "1",
      tempMinInFahrenheit: "28",
      tempMinInCelsius: "-2",
      tempMaxInFahrenheit: "40",
      tempMaxInCelsius: "4",
      pressure: "1045 hPa",
      humidity: "68%",
      windSpeed: "28 km/h",
      description: "Cloudy",
      dateTime: DateTime(2025, 1, 1),
    );

    testWidgets(
      "Displays forecast containers for each weather item",
      (WidgetTester tester) async {
        // Mocking
        final mockForecast = List.generate(
          5,
          (index) => weather.copyWith(
            dateTime: DateTime(2025, 1, index + 1),
          ),
        );

        const mockUnit = TemperatureUnit.celsius;

        // Act
        await mockNetworkImages(() async {
          return await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: WeekForecastWidget(
                  forecast: mockForecast,
                  unit: mockUnit,
                ),
              ),
            ),
          );
        });

        // Assert
        expect(
          find.byType(BriefWeatherWidget),
          findsNWidgets(mockForecast.length),
        );
        expect(
          find.byType(SingleChildScrollView),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      "Displays different sizes based on orientation",
      (WidgetTester tester) async {
        // Arrange
        final mockForecast = List.generate(
          3,
          (index) => weather.copyWith(
            dateTime: DateTime(2025, 1, index + 1),
          ),
        );

        const mockUnit = TemperatureUnit.fahrenheit;

        // Portrait Orientation
        tester.view.physicalSize = const Size(1080, 1920);
        tester.view.devicePixelRatio = 1.0;

        await mockNetworkImages(() async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: WeekForecastWidget(
                  forecast: mockForecast,
                  unit: mockUnit,
                ),
              ),
            ),
          );
        });

        // Assert portrait dimensions
        final portraitContainer =
            tester.firstWidget(find.byType(Container)) as Container;
        expect((portraitContainer.constraints?.maxWidth ?? 0) > 0, isTrue);

        // Landscape Orientation
        tester.view.physicalSize = const Size(1920, 1080);
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: WeekForecastWidget(
                forecast: mockForecast,
                unit: mockUnit,
              ),
            ),
          ),
        );

        // Assert landscape dimensions
        final landscapeContainer = tester.firstWidget(
          find.byType(Container),
        ) as Container;

        expect((landscapeContainer.constraints?.maxHeight ?? 0) > 0, isTrue);

        // Reset window properties
        addTearDown(tester.view.resetPhysicalSize);
      },
    );
  });
}
