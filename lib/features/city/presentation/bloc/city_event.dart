part of 'city_bloc.dart';

abstract class CityEvent extends Equatable {
  const CityEvent();

  @override
  List<Object> get props => [];
}

class GetAllCity extends CityEvent {}

class GetCity extends CityEvent {}
