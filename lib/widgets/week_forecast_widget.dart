import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/enums/enums.dart';
import 'package:weather_app/widgets/brief_weather_widget.dart';

class WeekForecastWidget extends StatelessWidget {
  final List<Weather> forecast;
  final TemperatureUnit unit;

  const WeekForecastWidget({
    super.key,
    required this.forecast,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.4;
    double height = MediaQuery.of(context).size.height * 0.18;
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      width = MediaQuery.of(context).size.width * 0.18;
      height = MediaQuery.of(context).size.height * 0.4;
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: forecast
            .map(
              (forecast) => Container(
                width: width,
                height: height,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: BriefWeatherWidget(
                  unit: unit,
                  weather: forecast,
                ),
              ),
            )
            .toList(growable: false),
      ),
    );
  }
}
