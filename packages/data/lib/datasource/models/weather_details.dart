import 'package:json_annotation/json_annotation.dart';

part 'weather_details.g.dart';

@JsonSerializable()
class WeatherDetails {
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? seaLevel;
  @JsonKey(name: "grnd_level")
  final int? groundLevel;
  final int? humidity;
  final double? tempKf;

  WeatherDetails({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.groundLevel,
    this.humidity,
    this.tempKf,
  });

  factory WeatherDetails.fromJson(Map<String, dynamic> json) =>
      _$WeatherDetailsFromJson(json);
}
