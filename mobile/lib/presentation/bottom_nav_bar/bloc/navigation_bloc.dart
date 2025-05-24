import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mental_health_app/presentation/bottom_nav_bar/bloc/navigation_events.dart';
import 'package:mental_health_app/presentation/bottom_nav_bar/bloc/navigation_states.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationChanged(index: 0)) {
    // when state in [NavigateTo]
    on<NavigateToEvent>((event, emit) {
      // assign the index from state [NavigateTo] to state
      // of [NavigationChanged] by event the parameter
      emit(NavigationChanged(index: event.index));
    });
  }
}
