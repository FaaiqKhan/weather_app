import 'package:data/data.dart' as datasource;
import 'package:domain/entities/entities.dart';
import 'package:domain/utils/utils.dart';

extension ForecastDataExtension on datasource.ForecastData {
  WeatherData toWeatherData() {
    return WeatherData(
      city: City(
        id: city?.id ?? 0,
        name: city?.name ?? "",
        country: city?.country ?? "",
        sunrise: city?.sunrise ?? 1,
        sunset: city?.sunset ?? 2,
      ),
      current: list!.first.toWeather(),
      forecast: [],
    );
  }
}

extension ForecastItemExtension on datasource.ForecastItem {
  Weather toWeather() {
    final tempInFahrenheit = weatherDetails?.temp ?? 32;
    final tempMinInFahrenheit = weatherDetails?.tempMin ?? 32;
    final tempMaxInFahrenheit = weatherDetails?.tempMax ?? 32;

    return Weather(
      id: weather?.first.id ?? 0,
      icon: weather?.first.icon ?? "",
      tempInFahrenheit: tempInFahrenheit,
      tempInCelsius: Utils.fahrenheitToCelsius(tempInFahrenheit),
      tempMinInFahrenheit: weatherDetails?.tempMin ?? 32,
      tempMinInCelsius: Utils.fahrenheitToCelsius(tempMinInFahrenheit),
      tempMaxInFahrenheit: tempMaxInFahrenheit,
      tempMaxInCelsius: Utils.fahrenheitToCelsius(tempMaxInFahrenheit),
      pressure: weatherDetails?.pressure ?? 0,
      humidity: weatherDetails?.humidity ?? 0,
      windSpeed: wind?.speed ?? 0.0,
      description: weather?.first.description ?? "",
    );
  }
}
