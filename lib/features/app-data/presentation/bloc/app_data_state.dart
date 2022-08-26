part of 'app_data_bloc.dart';

abstract class AppDataState extends Equatable {
  const AppDataState();

  @override
  List<Object> get props => [];
}

class AppDataInitial extends AppDataState {}

class AppDataSyncing extends AppDataState {}

class AppDataSynced extends AppDataState {}

class AppDataSyncError extends AppDataState {
  final String error;
  const AppDataSyncError({required this.error});

  @override
  List<Object> get props => [error];
}
