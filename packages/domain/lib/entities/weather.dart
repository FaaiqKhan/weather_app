class Weather {
  final int id;
  final String icon;
  final double tempInFahrenheit;
  final double tempInCelsius;
  final double tempMinInFahrenheit;
  final double tempMinInCelsius;
  final double tempMaxInFahrenheit;
  final double tempMaxInCelsius;
  final int pressure;
  final int humidity;
  final double windSpeed;
  final String description;

  Weather({
    required this.id,
    required this.icon,
    required this.tempInFahrenheit,
    required this.tempInCelsius,
    required this.tempMinInFahrenheit,
    required this.tempMinInCelsius,
    required this.tempMaxInFahrenheit,
    required this.tempMaxInCelsius,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.description,
  });

  Weather copyWith({
    int? id,
    String? icon,
    double? tempInFahrenheit,
    double? tempInCelsius,
    double? tempMinInFahrenheit,
    double? tempMinInCelsius,
    double? tempMaxInFahrenheit,
    double? tempMaxInCelsius,
    int? pressure,
    int? humidity,
    double? windSpeed,
    String? description,
  }) {
    return Weather(
      id: id ?? this.id,
      icon: icon ?? this.icon,
      tempInFahrenheit: tempInFahrenheit ?? this.tempInFahrenheit,
      tempInCelsius: tempInCelsius ?? this.tempInCelsius,
      tempMinInFahrenheit: tempMinInFahrenheit ?? this.tempMinInFahrenheit,
      tempMinInCelsius: tempMinInCelsius ?? this.tempMinInCelsius,
      tempMaxInFahrenheit: tempMaxInFahrenheit ?? this.tempMaxInFahrenheit,
      tempMaxInCelsius: tempMaxInCelsius ?? this.tempMaxInCelsius,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      windSpeed: windSpeed ?? this.windSpeed,
      description: description ?? this.description,
    );
  }
}
