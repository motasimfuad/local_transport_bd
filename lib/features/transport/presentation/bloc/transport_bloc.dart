import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transport_event.dart';
part 'transport_state.dart';

class TransportBloc extends Bloc<TransportEvent, TransportState> {
  TransportBloc() : super(TransportInitial()) {
    on<TransportEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
