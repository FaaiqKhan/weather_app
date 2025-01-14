// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

City _$CityFromJson(Map<String, dynamic> json) => City(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      coordinates: json['coord'] == null
          ? null
          : Coordinates.fromJson(json['coord'] as Map<String, dynamic>),
      country: json['country'] as String?,
      population: (json['population'] as num?)?.toInt(),
      timezone: (json['timezone'] as num?)?.toInt(),
      sunrise: (json['sunrise'] as num?)?.toInt(),
      sunset: (json['sunset'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coord': instance.coordinates,
      'country': instance.country,
      'population': instance.population,
      'timezone': instance.timezone,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
