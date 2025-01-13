import 'package:domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/blocs/home_screen/home_screen_bloc.dart';
import 'package:weather_app/enums/enums.dart';
import 'package:weather_app/extensions.dart';
import 'package:weather_app/utils.dart';
import 'package:weather_app/widgets/brief_weather_widget.dart';
import 'package:weather_app/widgets/temperature_unit_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  String getTemperatureInText(TemperatureUnit unit, Weather weather) {
    return unit == TemperatureUnit.celsius
        ? weather.tempInCelsius
        : weather.tempInFahrenheit;
  }

  Widget showDetailsWidget(Weather weather) {
    return Align(
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
    );
  }

  Widget showTitleWidget(Weather weather) {
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

  Widget showForecastWidget(List<Weather> forecast, TemperatureUnit unit) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: forecast
            .map(
              (forecast) => BriefWeatherWidget(
                unit: unit,
                weather: forecast,
              ),
            )
            .toList(growable: false),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      buildWhen: (previous, current) {
        if (previous is HomeScreenLoadedState &&
            current is HomeScreenLoadedState) {
          return previous.weatherData.current != current.weatherData.current ||
              previous.unit != current.unit;
        }
        return false;
      },
      builder: (context, state) {
        final castedState = state as HomeScreenLoadedState;
        final weather = castedState.weatherData.current;
        return SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 20),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                showTitleWidget(castedState.weatherData.current),
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.3,
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
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getTemperatureInText(state.unit, weather),
                            style: TextStyle(
                              fontSize: 38,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            Utils.getTemperatureUnitInText(state.unit),
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      showDetailsWidget(state.weatherData.current),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                showForecastWidget(
                  castedState.weatherData.forecast,
                  state.unit,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
