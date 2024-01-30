import 'package:courses_app/buisness_logic/welcome_bloc/welcome_events.dart';
import 'package:courses_app/buisness_logic/welcome_bloc/welcome_states.dart';
import 'package:courses_app/core/extension/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  final PageController pageController = PageController(initialPage: 0);
  WelcomeBloc() : super(WelcomeState()) {
    'WelcomeBloc instance is created'.prt;
    on<WelcomeEvent>((event, emit) => emit(WelcomeState(page: state.page)));
  }
}
