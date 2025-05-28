import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(BottomNavigationState(0)) {
    on<BottomNavigationEvent>(_bottomNavigationEvent);
  }
  FutureOr<void> _bottomNavigationEvent(BottomNavigationEvent event, Emitter<BottomNavigationState> emit) {
    
    emit(BottomNavigationState(event.index));
  }
}
