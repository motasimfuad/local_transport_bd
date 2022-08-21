import 'package:equatable/equatable.dart';
import 'package:local_transport_bd/core/constants/enums.dart';

class TransportEntity extends Equatable {
  final String cityId;
  final TransportType transportType;
  final String english;
  final String bengali;
  final String? image;
  final List<String> routes;
  final String? time;
  final String? serviceType;

  const TransportEntity({
    required this.cityId,
    required this.transportType,
    required this.english,
    required this.bengali,
    this.image,
    required this.routes,
    this.time,
    this.serviceType,
  });

  @override
  List<Object?> get props => [];
}
