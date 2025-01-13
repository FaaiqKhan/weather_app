import 'package:json_annotation/json_annotation.dart';

part 'weather_details.g.dart';

@JsonSerializable()
class WeatherDetails {
  final double? temp;
  @JsonKey(name: "feels_like")
  final double? feelsLike;
  @JsonKey(name: "temp_min")
  final double? tempMin;
  @JsonKey(name: "temp_max")
  final double? tempMax;
  final int? pressure;
  @JsonKey(name: "sea_level")
  final int? seaLevel;
  @JsonKey(name: "grnd_level")
  final int? groundLevel;
  final int? humidity;
  @JsonKey(name: "temp_kf")
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
