import 'package:data/data.dart';
import 'package:domain/entities/entities.dart';

extension _ on ForecastData {
  WeatherData toWeatherData() {
    return WeatherData(
      city: City(
        id: city?.id ?? 0,
        name: city?.name ?? "",
        country: city?.country ?? "",
        sunrise: city?.sunrise ?? 1,
        sunset: city?.sunset ?? 2,
      ),
      current: Weather(
        id: 1,
        main: "",
        icon: "",
        temp: 1,
        tempMin: 1,
        tempMax: 1,
        pressure: 1,
        humidity: 1,
        windSpeed: 1,
      ),
      forecast: [],
    );
  }
}
