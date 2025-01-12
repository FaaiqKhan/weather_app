import 'package:domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/enums/enums.dart';
import 'package:weather_app/extensions.dart';
import 'package:weather_app/utils.dart';
import 'package:weather_app/widgets/brief_weather_widget.dart';
import 'package:weather_app/widgets/temperature_unit_menu.dart';

class HomeScreen extends StatelessWidget {
  final Weather weather;
  final TemperatureUnit unit;

  const HomeScreen({
    required this.weather,
    required this.unit,
    super.key,
  });

  String getTemperatureInText() {
    return unit == TemperatureUnit.celsius
        ? weather.tempInCelsius
        : weather.tempInFahrenheit;
  }

  String getTemperatureUnitInText() {
    return unit == TemperatureUnit.celsius ? '°C' : '°F';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 48.0),
                    child: Text(
                      Utils.getDayOfTheWeek(weather.dateTime),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                TemperatureUnitMenu(),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      weather.description.toTitleCase,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Image.network(
                    weather.icon,
                    scale: 0.4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getTemperatureInText(),
                        style: TextStyle(
                          fontSize: 38,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        getTemperatureUnitInText(),
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Humidity: ${weather.humidity}%",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Pressure: ${weather.pressure} hPa",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Wind: ${weather.windSpeed} km/h",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  BriefWeatherWidget(),
                  BriefWeatherWidget(),
                  BriefWeatherWidget(),
                  BriefWeatherWidget(),
                  BriefWeatherWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
