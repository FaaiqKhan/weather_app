import 'package:domain/src/entities/entities.dart';

class WeatherData {
  final City city;
  final Weather current;
  final List<Weather> forecast;

  WeatherData({
    required this.city,
    required this.current,
    required this.forecast,
  });

  WeatherData copyWith({
    City? city,
    Weather? current,
    List<Weather>? forecast,
  }) {
    return WeatherData(
      city: city ?? this.city,
      current: current ?? this.current,
      forecast: forecast ?? this.forecast,
    );
  }
}
