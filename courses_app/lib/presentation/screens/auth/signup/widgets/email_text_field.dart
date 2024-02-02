import 'package:courses_app/buisness_logic/auth/signup_bloc/signup_bloc.dart';
import 'package:courses_app/presentation/components/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailTextField extends StatelessWidget {
  EmailTextField({
    super.key,
  });

  late SignupBloc signupBloc;
  @override
  Widget build(BuildContext context) {
    signupBloc = context.read();
    return CustomFormField(
      type: EntryType.email,
      controller: signupBloc.emailController,
      suffixIcon: const Icon(Icons.email),
    );
  }
}
