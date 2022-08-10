import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_route_event.dart';
part 'search_route_state.dart';

class SearchRouteBloc extends Bloc<SearchRouteEvent, SearchRouteState> {
  SearchRouteBloc() : super(SearchRouteInitial()) {
    on<SearchRouteEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
