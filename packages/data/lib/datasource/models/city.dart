import 'package:data/datasource/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable()
class City {
  final int? id;
  final String? name;
  @JsonKey(name: "coord")
  final Coordinates? coordinates;
  final String? country;
  final int? population;
  final int? timezone;
  final int? sunrise;
  final int? sunset;

  City({
    this.id,
    this.name,
    this.coordinates,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}
