// ignore_for_file: use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:courses_app/core/extension/extensions.dart';
import 'package:courses_app/core/router/app_routes_names.dart';
import 'package:courses_app/presentation/components/custom_alert_dialogue.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passOneController = TextEditingController();
  TextEditingController passTwoController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  SignupBloc() : super(const SignupState()) {
    on<SignupEvent>(_signupEvent);
  }

  void _signupEvent(SignupEvent event, Emitter<SignupState> emit) async {
    bool result = await _createUserWithEmailAndPassword(
      emailAddress: event.email,
      username: event.username,
      password: event.password,
      context: event.context,
    );
    if (result) {
      emit(SignupState(
        username: event.username,
        email: event.email,
        password: event.password,
        phone: event.phone,
      ));
      await customAlertDialogue(
        context: event.context,
        msg: 'The registration process has been successfully completed. Kindly check your email to verify your account'.prt,
      );
      Navigator.of(event.context).pushReplacementNamed(AppRoutesNames.signin);
    } else {
      'Failed To Create The User'.prt;
    }
  }

  Future<bool> _createUserWithEmailAndPassword({
    required String emailAddress,
    required String username,
    required String password,
    required BuildContext context,
  }) async {
    'createUserWithEmailAndPassword - FbAuth'.prt;
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      'New user is created successfully'.pr;
      if (credential.user != null) {
        await credential.user!.updateDisplayName(username);
        await credential.user!.sendEmailVerification();
      } else {
        'credential.user = null'.pr;
      }
      return true;
    } on FirebaseAuthException catch (e) {
      'Error caught by try and catch block'.pr;
      if (e.code == 'weak-password') {
        customAlertDialogue(context: context, msg: 'The password given is not strong enough.'.pr);
      } else if (e.code == 'email-already-in-use') {
        customAlertDialogue(context: context, msg: 'This email address has already been registered'.pr);
      }
      e.code.pr;
      return false;
    } catch (e) {
      'Error caught by try and catch block'.pr;
      customAlertDialogue(context: context, msg: '$e'.pr);
      return false;
    }
  }
}
