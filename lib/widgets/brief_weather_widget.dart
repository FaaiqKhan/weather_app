import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/home_screen/home_screen_bloc.dart';
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

  String temperatureUnit() => Utils.getTemperatureUnitInText(unit);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.read<HomeScreenBloc>().add(SelectForecastDay(weather)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(Utils.getAbbrOfDayOfTheWeek(weather.dateTime)),
          SizedBox(
            width: 100,
            height: 100,
            child: Image.network(
              weather.icon,
              loadingBuilder: (_, child, progress) {
                if (progress == null) return child;
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          Visibility(
            visible: unit == TemperatureUnit.celsius,
            replacement: Text(temperatureInFahrenheit() + temperatureUnit()),
            child: Text(temperatureInCelsius() + temperatureUnit()),
          ),
        ],
      ),
    );
  }
}
