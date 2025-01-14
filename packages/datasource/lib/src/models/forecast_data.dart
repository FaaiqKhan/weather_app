import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'forecast_data.g.dart';

@JsonSerializable()
class ForecastData {
  final String? cod;
  final int? message;
  final int? cnt;
  final List<ForecastItem>? list;
  final City? city;

  ForecastData({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  });

  factory ForecastData.fromJson(Map<String, dynamic> json) =>
      _$ForecastDataFromJson(json);
}
