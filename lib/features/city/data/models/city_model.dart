// ignore_for_file: annotate_overrides, overridden_fields

import 'dart:convert';

import '../../domain/entities/city_entity.dart';

class CityModel extends CityEntity {
  final String id;
  final String name;

  const CityModel({
    required this.id,
    required this.name,
  }) : super(
          id: id,
          name: name,
        );

  CityModel copyWith({
    String? id,
    String? name,
  }) {
    return CityModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  factory CityModel.fromJson(String str) => CityModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CityModel.fromMap(Map<String, dynamic> json) => CityModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}
