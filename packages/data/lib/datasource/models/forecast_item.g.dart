// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'forecast_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastItem _$ForecastItemFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ForecastItem',
      json,
      ($checkedConvert) {
        final val = ForecastItem(
          dt: $checkedConvert('dt', (v) => (v as num?)?.toInt()),
          weatherDetails: $checkedConvert(
              'main',
              (v) => v == null
                  ? null
                  : WeatherDetails.fromJson(v as Map<String, dynamic>)),
          weather: $checkedConvert(
              'weather',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
                  .toList()),
          clouds: $checkedConvert(
              'clouds',
              (v) => v == null
                  ? null
                  : Clouds.fromJson(v as Map<String, dynamic>)),
          wind: $checkedConvert(
              'wind',
              (v) =>
                  v == null ? null : Wind.fromJson(v as Map<String, dynamic>)),
          visibility:
              $checkedConvert('visibility', (v) => (v as num?)?.toInt()),
          pop: $checkedConvert('pop', (v) => (v as num?)?.toDouble()),
          dtTxt: $checkedConvert('dtTxt', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'weatherDetails': 'main'},
    );
