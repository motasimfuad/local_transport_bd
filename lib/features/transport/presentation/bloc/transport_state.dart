part of 'transport_bloc.dart';

abstract class TransportState extends Equatable {
  const TransportState();  

  @override
  List<Object> get props => [];
}
class TransportInitial extends TransportState {}
