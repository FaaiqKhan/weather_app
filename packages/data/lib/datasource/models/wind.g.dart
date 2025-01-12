// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'wind.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wind _$WindFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Wind',
      json,
      ($checkedConvert) {
        final val = Wind(
          speed: $checkedConvert('speed', (v) => (v as num?)?.toDouble()),
          deg: $checkedConvert('deg', (v) => (v as num?)?.toInt()),
          gust: $checkedConvert('gust', (v) => (v as num?)?.toDouble()),
        );
        return val;
      },
    );
