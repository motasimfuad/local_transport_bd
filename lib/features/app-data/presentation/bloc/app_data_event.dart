part of 'app_data_bloc.dart';

abstract class AppDataEvent extends Equatable {
  const AppDataEvent();

  @override
  List<Object> get props => [];
}

class SyncAppData extends AppDataEvent {}

class SyncAppDataCompleted extends AppDataEvent {}
