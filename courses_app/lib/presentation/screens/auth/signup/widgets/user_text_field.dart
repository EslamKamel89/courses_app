import 'package:courses_app/buisness_logic/auth/signup_bloc/signup_bloc.dart';
import 'package:courses_app/presentation/components/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsenameTextField extends StatelessWidget {
  UsenameTextField({
    super.key,
  });

  late SignupBloc signupBloc;
  @override
  Widget build(BuildContext context) {
    signupBloc = context.read();
    return CustomFormField(
      type: EntryType.username,
      controller: signupBloc.usernameController,
      suffixIcon: const Icon(Icons.person),
    );
  }
}
