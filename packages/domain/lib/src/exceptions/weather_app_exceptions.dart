abstract class WeatherAppExceptions implements Exception {
  final String message;

  WeatherAppExceptions(this.message);
}

class UnauthorizedException implements WeatherAppExceptions {
  @override
  String get message => "Invalid API key";
}

class GeneralException implements WeatherAppExceptions {
  @override
  String get message => "Ops! something went wrong, please try again later";
}
