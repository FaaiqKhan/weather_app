import 'package:domain/entities/entities.dart';

class WeatherData {
  final City city;
  final Weather current;
  final List<Weather> forecast;

  WeatherData({
    required this.city,
    required this.current,
    required this.forecast,
  });
}
