import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class WeatherDetailsWidget extends StatelessWidget {
  final Weather weather;

  const WeatherDetailsWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Humidity: ${weather.humidity}",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Pressure: ${weather.pressure}",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Wind: ${weather.windSpeed}",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}