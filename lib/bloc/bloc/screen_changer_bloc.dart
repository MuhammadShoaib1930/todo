import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'screen_changer_event.dart';
part 'screen_changer_state.dart';

class ScreenChangerBloc extends Bloc<BaseEvent, ScreenChangerState> {
  ScreenChangerBloc() : super(ScreenChangerState(currentIndex: 0)) {
    on<ScreenChangerEvent>(_screenChangerEvent);
  }

  FutureOr<void> _screenChangerEvent(ScreenChangerEvent event, Emitter<ScreenChangerState> emit) {
    emit(ScreenChangerState(currentIndex: event.currentIndex));
  }
}
