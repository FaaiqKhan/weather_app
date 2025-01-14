import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:weather_app/blocs/home_screen/home_screen_bloc.dart';
import 'package:weather_app/enums/enums.dart';
import 'package:weather_app/widgets/brief_weather_widget.dart';

import 'brief_weather_widget_test.mocks.dart';

@GenerateMocks([HomeScreenBloc])
void main() {
  late HomeScreenBloc mockBloc;

  setUp(() {
    mockBloc = MockHomeScreenBloc();
  });

  group("BriefWeatherWidget", () {
    // Mocking
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

    Widget createWidgetUnderTest(TemperatureUnit unit) {
      return BlocProvider<HomeScreenBloc>(
        create: (_) => mockBloc,
        child: MaterialApp(
          home: Scaffold(
            body: BriefWeatherWidget(weather: weather, unit: unit),
          ),
        ),
      );
    }

    testWidgets(
      "Displays day abbreviation, weather icon, and temperatures in Celsius",
      (WidgetTester tester) async {
        await mockNetworkImages(() async {
          return await tester.pumpWidget(
            createWidgetUnderTest(
              TemperatureUnit.celsius,
            ),
          );
        });

        // Assert
        expect(find.text("Wed"), findsOneWidget);
        expect(find.byType(Image), findsOneWidget);
        expect(find.text("4/-2°C"), findsOneWidget);
      },
    );

    testWidgets(
      "Displays day abbreviation, weather icon, and temperatures in Fahrenheit",
      (WidgetTester tester) async {
        await mockNetworkImages(() async {
          await tester.pumpWidget(
            createWidgetUnderTest(
              TemperatureUnit.fahrenheit,
            ),
          );
        });

        // Assert
        expect(find.text("Wed"), findsOneWidget);
        expect(find.byType(Image), findsOneWidget);
        expect(find.text("40/28°F"), findsOneWidget);
      },
    );

    testWidgets(
      "Displays loading indicator while image is loading",
      (WidgetTester tester) async {
        late Widget progressWidget;
        await mockNetworkImages(() async {
          await tester.pumpWidget(
            createWidgetUnderTest(
              TemperatureUnit.fahrenheit,
            ),
          );

          final imageFinder = find.byType(Image);

          // Simulate image loading
          final imageWidget = tester.widget<Image>(imageFinder);
          // Mocking
          final loadingBuilder = imageWidget.loadingBuilder!;
          progressWidget = loadingBuilder(
            tester.element(imageFinder),
            Center(
              child: CircularProgressIndicator(),
            ),
            ImageChunkEvent(cumulativeBytesLoaded: 0, expectedTotalBytes: 100),
          );
        });

        // Assert
        expect(
          progressWidget,
          isA<Center>().having(
            (widget) => widget.child,
            "CircularProgressIndicator",
            isA<CircularProgressIndicator>(),
          ),
        );
      },
    );

    testWidgets(
      "Triggers HomeScreenBloc event when tapped",
      (WidgetTester tester) async {
        /**
         * context.read<Bloc>().add() method relies on a stream internally,
         * HomeScreenBloc is mocked for testing, so we have to mock the stream to test the tap gesture event
         */
        when(mockBloc.stream).thenAnswer((_) => Stream.empty());

        await mockNetworkImages(() async {
          await tester.pumpWidget(
            createWidgetUnderTest(
              TemperatureUnit.fahrenheit,
            ),
          );

          // Act
          await tester.tap(
            find.byType(GestureDetector),
          );

          return await tester.pump();
        });

        // Assert
        verify(
          mockBloc.add(
            SelectForecastDay(weather),
          ),
        ).called(1);
      },
    );
  });
}
