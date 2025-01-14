import 'package:json_annotation/json_annotation.dart';

part 'clouds.g.dart';

@JsonSerializable()
class Clouds {
  final int? all;

  Clouds({this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
}
