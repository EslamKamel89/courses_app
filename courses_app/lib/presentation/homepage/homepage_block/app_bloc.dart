// ignore_for_file: unused_import

import 'package:bloc/bloc.dart';
import 'package:courses_app/core/extension/extensions.dart';
import 'package:courses_app/presentation/homepage/homepage_block/app_events.dart';
import 'package:courses_app/presentation/homepage/homepage_block/app_states.dart';

class AppBloc extends Bloc<AppEvents, AppState> {
  AppBloc() : super(InitStates()) {
    'AppBloc instance is created'.prt;
    on<IncrementEvent>((event, emit) {
      emit(AppState(counter: (state.counter + 1)));
    });
    on<DecrementEvent>((event, emit) {
      emit(AppState(counter: (state.counter - 1)));
      return null;
    });
  }
}
