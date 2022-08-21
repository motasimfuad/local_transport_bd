// ignore_for_file: overridden_fields, annotate_overrides

import 'dart:convert';

import 'package:local_transport_bd/features/transport/domain/entities/transport_entity.dart';

import '../../../../core/constants/enums.dart';

class TransportModel extends TransportEntity {
  final String uid;
  final String cityId;
  final TransportType transportType;
  final String english;
  final String bengali;
  final String? image;
  final List<String> routes;
  final String? time;
  final String? serviceType;

  const TransportModel({
    required this.uid,
    required this.cityId,
    required this.transportType,
    required this.english,
    required this.bengali,
    this.image,
    required this.routes,
    this.time,
    this.serviceType,
  }) : super(
          uid: uid,
          cityId: cityId,
          transportType: transportType,
          english: english,
          bengali: bengali,
          image: image,
          routes: routes,
          time: time,
          serviceType: serviceType,
        );

  TransportModel copyWith({
    String? uid,
    String? cityId,
    TransportType? transportType,
    String? english,
    String? bengali,
    String? image,
    List<String>? routes,
    String? time,
    String? serviceType,
  }) =>
      TransportModel(
        uid: uid ?? this.uid,
        cityId: cityId ?? this.cityId,
        transportType: transportType ?? this.transportType,
        english: english ?? this.english,
        bengali: bengali ?? this.bengali,
        image: image ?? this.image,
        routes: routes ?? this.routes,
        time: time ?? this.time,
        serviceType: serviceType ?? this.serviceType,
      );

  factory TransportModel.fromJson(String str) =>
      TransportModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TransportModel.fromMap(Map<String, dynamic> json) => TransportModel(
        uid: json["uid"],
        cityId: json["city_id"],
        transportType: json["transport_type"],
        english: json["english"],
        bengali: json["bengali"],
        image: json["image"],
        routes: List<String>.from(json["routes"].map((x) => x)),
        time: json["time"],
        serviceType: json["service_type"],
      );

  Map<String, dynamic> toMap() => {
        "uid": uid,
        "city_id": cityId,
        "transport_type": transportType,
        "english": english,
        "bengali": bengali,
        "image": image,
        "routes": List<dynamic>.from(routes.map((x) => x)),
        "time": time,
        "service_type": serviceType,
      };
}
