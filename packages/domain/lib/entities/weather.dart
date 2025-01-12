class Weather {
  final int id;
  final String icon;
  final double temp;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final double windSpeed;
  final String description;

  Weather({
    required this.id,
    required this.icon,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.windSpeed,
    required this.description,
  });
}
