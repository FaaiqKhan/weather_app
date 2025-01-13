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
              $checkedConvert('feels_like', (v) => (v as num?)?.toDouble()),
          tempMin: $checkedConvert('temp_min', (v) => (v as num?)?.toDouble()),
          tempMax: $checkedConvert('temp_max', (v) => (v as num?)?.toDouble()),
          pressure: $checkedConvert('pressure', (v) => (v as num?)?.toInt()),
          seaLevel: $checkedConvert('sea_level', (v) => (v as num?)?.toInt()),
          groundLevel:
              $checkedConvert('grnd_level', (v) => (v as num?)?.toInt()),
          humidity: $checkedConvert('humidity', (v) => (v as num?)?.toInt()),
          tempKf: $checkedConvert('temp_kf', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
      fieldKeyMap: const {
        'feelsLike': 'feels_like',
        'tempMin': 'temp_min',
        'tempMax': 'temp_max',
        'seaLevel': 'sea_level',
        'groundLevel': 'grnd_level',
        'tempKf': 'temp_kf'
      },
    );
