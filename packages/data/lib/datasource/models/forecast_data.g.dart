// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'forecast_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastData _$ForecastDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ForecastData',
      json,
      ($checkedConvert) {
        final val = ForecastData(
          cod: $checkedConvert('cod', (v) => v as String?),
          message: $checkedConvert('message', (v) => (v as num?)?.toInt()),
          cnt: $checkedConvert('cnt', (v) => (v as num?)?.toInt()),
          list: $checkedConvert(
              'list',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => ForecastItem.fromJson(e as Map<String, dynamic>))
                  .toList()),
          city: $checkedConvert(
              'city',
              (v) =>
                  v == null ? null : City.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );
