import 'package:courses_app/buisness_logic/auth/signin_bloc/signin_bloc.dart';
import 'package:courses_app/presentation/components/custom_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailTextFeild extends StatelessWidget {
  EmailTextFeild({
    super.key,
  });
  late SigninBloc signinBloc;
  @override
  Widget build(BuildContext context) {
    signinBloc = context.read();
    return CustomFormField(
      type: EntryType.email,
      controller: signinBloc.emailController,
      suffixIcon: const Icon(Icons.email),
    );
  }
}
