import 'package:domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/enums/enums.dart';
import 'package:weather_app/utils.dart';

class BriefWeatherWidget extends StatelessWidget {
  final Weather weather;
  final TemperatureUnit unit;

  const BriefWeatherWidget({
    required this.weather,
    required this.unit,
    super.key,
  });

  String temperatureInFahrenheit() =>
      "${weather.tempMaxInFahrenheit}/${weather.tempMinInFahrenheit}";

  String temperatureInCelsius() =>
      "${weather.tempMaxInCelsius}/${weather.tempMinInCelsius}";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            Utils.getAbbrOfDayOfTheWeek(weather.dateTime),
          ),
          Image.network("https://openweathermap.org/img/wn/10d@2x.png"),
          Visibility(
            visible: unit == TemperatureUnit.celsius,
            replacement: Text(temperatureInFahrenheit()),
            child: Text(temperatureInCelsius()),
          ),
        ],
      ),
    );
  }
}
