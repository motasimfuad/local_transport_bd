import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:local_transport_bd/features/city/presentation/bloc/city_bloc.dart';

part 'app_data_event.dart';
part 'app_data_state.dart';

class AppDataBloc extends Bloc<AppDataEvent, AppDataState> {
  final CityBloc cityBloc;

  AppDataBloc({
    required this.cityBloc,
  }) : super(AppDataInitial()) {
    on<SyncAppData>((event, emit) async {});
  }
}
