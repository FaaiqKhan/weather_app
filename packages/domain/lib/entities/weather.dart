class Weather {
  final int id;
  final String icon;
  final String tempInFahrenheit;
  final String tempInCelsius;
  final String tempMinInFahrenheit;
  final String tempMinInCelsius;
  final String tempMaxInFahrenheit;
  final String tempMaxInCelsius;
  final int pressure;
  final int humidity;
  final String windSpeed;
  final String description;
  final DateTime dateTime;

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
    required this.dateTime,
  });

  Weather copyWith({
    int? id,
    String? icon,
    String? tempInFahrenheit,
    String? tempInCelsius,
    String? tempMinInFahrenheit,
    String? tempMinInCelsius,
    String? tempMaxInFahrenheit,
    String? tempMaxInCelsius,
    int? pressure,
    int? humidity,
    String? windSpeed,
    String? description,
    DateTime? dateTime,
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
      dateTime: dateTime ?? this.dateTime,
    );
  }
}
