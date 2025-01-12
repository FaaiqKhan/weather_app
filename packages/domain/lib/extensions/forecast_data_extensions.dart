import 'package:data/data.dart' as datasource;
import 'package:domain/entities/entities.dart';

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
    return Weather(
      id: weather?.first.id ?? 0,
      icon: weather?.first.icon ?? "",
      temp: weatherDetails?.temp ?? 0.0,
      tempMin: weatherDetails?.tempMin ?? 0.0,
      tempMax: weatherDetails?.tempMax ?? 0.0,
      pressure: weatherDetails?.pressure ?? 0,
      humidity: weatherDetails?.humidity ?? 0,
      windSpeed: wind?.speed ?? 0.0,
      description: weather?.first.description ?? "",
    );
  }
}
