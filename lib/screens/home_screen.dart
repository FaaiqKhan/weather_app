import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/enums/enums.dart';
import 'package:weather_app/extensions.dart';
import 'package:weather_app/utils.dart';
import 'package:weather_app/widgets/screen_title_widget.dart';
import 'package:weather_app/widgets/weather_details_widget.dart';
import 'package:weather_app/widgets/week_forecast_widget.dart';

class HomeScreen extends StatelessWidget {
  final WeatherData weatherData;
  final TemperatureUnit unit;

  const HomeScreen({
    super.key,
    required this.weatherData,
    required this.unit,
  });

  String getTemperatureInText(TemperatureUnit unit, Weather weather) {
    return unit == TemperatureUnit.celsius
        ? weather.tempInCelsius
        : weather.tempInFahrenheit;
  }

  Widget showImageWidget(BuildContext context, Weather weather) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height * 0.3;
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      width = MediaQuery.of(context).size.height * 0.35;
      height = MediaQuery.of(context).size.width * 0.15;
    }
    return SizedBox(
      width: width,
      height: height,
      child: Image.network(
        weather.icon,
        fit: BoxFit.fitWidth,
        alignment: Alignment.center,
        loadingBuilder: (_, child, progress) {
          if (progress == null) return child;
          return Center(
            child: CircularProgressIndicator(),
          );
        },
        errorBuilder: (_, __, ___) => Center(
          child: Text(
            "Image not found",
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ScreenTitleWidget(weather: weatherData.current),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  weatherData.current.description.toTitleCase,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              showImageWidget(context, weatherData.current),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getTemperatureInText(unit, weatherData.current),
                    style: TextStyle(
                      fontSize: 38,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    Utils.getTemperatureUnitInText(unit),
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              WeatherDetailsWidget(
                weather: weatherData.current,
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        WeekForecastWidget(
          forecast: weatherData.forecast,
          unit: unit,
        ),
      ],
    );
  }
}
