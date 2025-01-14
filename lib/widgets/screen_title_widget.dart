import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/utils.dart';
import 'package:weather_app/widgets/temperature_unit_menu.dart';

class ScreenTitleWidget extends StatelessWidget {
  final Weather weather;
  const ScreenTitleWidget({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}