import 'package:local_transport_bd/features/city/domain/entities/city_entity.dart';

import '../../../transport/domain/entities/transport_entity.dart';

class AppDataEntity {
  List<CityEntity> cities;
  List<TransportEntity> transports;
  AppDataEntity({
    required this.cities,
    required this.transports,
  });
}
