import 'dart:async';

abstract class OpenWeatherAPIClient {
  FutureOr<void> fetchWeatherDetails({required lat, required lon});
}