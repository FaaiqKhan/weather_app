// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastData _$ForecastDataFromJson(Map<String, dynamic> json) => ForecastData(
      cod: json['cod'] as String?,
      message: (json['message'] as num?)?.toInt(),
      cnt: (json['cnt'] as num?)?.toInt(),
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => ForecastItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastDataToJson(ForecastData instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'message': instance.message,
      'cnt': instance.cnt,
      'list': instance.list,
      'city': instance.city,
    };
