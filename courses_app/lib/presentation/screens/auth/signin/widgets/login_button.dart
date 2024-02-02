import 'package:courses_app/buisness_logic/auth/signin_bloc/signin_bloc.dart';
import 'package:courses_app/presentation/components/decorated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  LoginButton({
    super.key,
  });
  late SigninBloc signinBloc;
  @override
  Widget build(BuildContext context) {
    signinBloc = context.read();
    return InkWell(
      onTap: () {
        if (signinBloc.formkey.currentState!.validate()) {
          signinBloc.add(EmailEvent(email: signinBloc.emailController.text));
          signinBloc.add(PasswordEvent(password: signinBloc.passwordController.text));
          signinBloc.add(SigninHandleEvent(context: context));
        }
      },
      child: const DecoratedButton(title: 'Log In'),
    );
  }
}
