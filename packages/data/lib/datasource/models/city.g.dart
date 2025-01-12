// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

City _$CityFromJson(Map<String, dynamic> json) => $checkedCreate(
      'City',
      json,
      ($checkedConvert) {
        final val = City(
          id: $checkedConvert('id', (v) => (v as num?)?.toInt()),
          name: $checkedConvert('name', (v) => v as String?),
          coordinates: $checkedConvert(
              'coord',
              (v) => v == null
                  ? null
                  : Coordinates.fromJson(v as Map<String, dynamic>)),
          country: $checkedConvert('country', (v) => v as String?),
          population:
              $checkedConvert('population', (v) => (v as num?)?.toInt()),
          timezone: $checkedConvert('timezone', (v) => (v as num?)?.toInt()),
          sunrise: $checkedConvert('sunrise', (v) => (v as num?)?.toInt()),
          sunset: $checkedConvert('sunset', (v) => (v as num?)?.toInt()),
        );
        return val;
      },
      fieldKeyMap: const {'coordinates': 'coord'},
    );
