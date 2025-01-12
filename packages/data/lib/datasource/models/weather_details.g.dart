// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'weather_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDetails _$WeatherDetailsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'WeatherDetails',
      json,
      ($checkedConvert) {
        final val = WeatherDetails(
          temp: $checkedConvert('temp', (v) => (v as num?)?.toDouble()),
          feelsLike:
              $checkedConvert('feelsLike', (v) => (v as num?)?.toDouble()),
          tempMin: $checkedConvert('tempMin', (v) => (v as num?)?.toDouble()),
          tempMax: $checkedConvert('tempMax', (v) => (v as num?)?.toDouble()),
          pressure: $checkedConvert('pressure', (v) => (v as num?)?.toInt()),
          seaLevel: $checkedConvert('seaLevel', (v) => (v as num?)?.toInt()),
          groundLevel:
              $checkedConvert('grnd_level', (v) => (v as num?)?.toInt()),
          humidity: $checkedConvert('humidity', (v) => (v as num?)?.toInt()),
          tempKf: $checkedConvert('tempKf', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {'groundLevel': 'grnd_level'},
    );
