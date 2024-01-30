import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SigninBloc() : super(const SigninState()) {
    on<SigninEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
