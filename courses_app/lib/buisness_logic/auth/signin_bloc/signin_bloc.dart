// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:courses_app/core/extension/extensions.dart';
import 'package:courses_app/core/router/app_routes_names.dart';
import 'package:courses_app/presentation/components/custom_alert_dialogue.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();

  SigninBloc() : super(const SigninState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<SigninHandleEvent>(_signinHandleEvent);
    on<GoToSignupEvent>(_goToSignupEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SigninState> emit) {
    'EmailEvent : ${event.email}'.prt;
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SigninState> emit) {
    'PasswordEvent : ${event.password}'.prt;
    emit(state.copyWith(password: event.password));
  }

  void _signinHandleEvent(SigninHandleEvent event, Emitter<SigninState> emit) {
    _handleSignin('email', event.context);
  }

  void _goToSignupEvent(GoToSignupEvent event, Emitter<SigninState> emit) {
    Navigator.of(event.context).pushNamed(AppRoutesNames.signup);
  }

  Future _handleSignin(String type, BuildContext context) async {
    try {
      if (type == 'email') {
        final SigninState state = context.read<SigninBloc>().state;
        // 'Email and password before signin '.prt;
        String emailAddress = state.email;
        String password = state.password;
        final UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password,
        );
        User? user = credential.user;
        if (user != null) {
          // customAlertDialogue(context: context, msg: 'Email and Password are right'.prt);
          if (user.emailVerified) {
            Navigator.of(context).pushNamedAndRemoveUntil(AppRoutesNames.mainPage, (route) => false);
          } else {
            customAlertDialogue(
              context: context,
              msg: 'To fully enjoy the app, we kindly request you to verify your email.'.prt,
            );
            // TODO
          }
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        customAlertDialogue(context: context, msg: 'This email does not exist '.prt);
      } else if (e.code == 'wrong-password') {
        customAlertDialogue(context: context, msg: 'The password entered for that user is incorrect.'.prt);
      } else if (e.code == 'invalid-emai') {
        customAlertDialogue(context: context, msg: 'The email entered is not found.'.prt);
      } else if (e.code == 'user-disabled') {
        customAlertDialogue(context: context, msg: 'Sorry this account is disabled.'.prt);
      } else {
        customAlertDialogue(context: context, msg: 'Incorrect email or password.'.prt);
      }
      // TODO
    }
  }
}
