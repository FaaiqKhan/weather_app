import 'package:data/datasource/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forecast_item.g.dart';

@JsonSerializable()
class ForecastItem {
  final int? dt;
  @JsonKey(name: "main")
  final WeatherDetails? weatherDetails;
  final List<Weather>? weather;
  final Clouds? clouds;
  final Wind? wind;
  final int? visibility;
  final double? pop;
  final String? dtTxt;

  ForecastItem({
    this.dt,
    this.weatherDetails,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.dtTxt,
  });

  factory ForecastItem.fromJson(Map<String, dynamic> json) =>
      _$ForecastItemFromJson(json);
}
