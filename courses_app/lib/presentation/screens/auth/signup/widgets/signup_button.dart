import 'package:courses_app/buisness_logic/auth/signup_bloc/signup_bloc.dart';
import 'package:courses_app/presentation/components/custom_alert_dialogue.dart';
import 'package:courses_app/presentation/components/decorated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupButton extends StatelessWidget {
  SignupButton({
    super.key,
  });
  late SignupBloc signupBloc;
  @override
  Widget build(BuildContext context) {
    signupBloc = context.read();
    return InkWell(
      onTap: () {
        if (signupBloc.formKey.currentState!.validate()) {
          if (signupBloc.passOneController.text != signupBloc.passTwoController.text) {
            customAlertDialogue(context: context, msg: "The Two Passwords don't match");
          } else {
            signupBloc.add(SignupEvent(
              context: context,
              username: signupBloc.usernameController.text,
              email: signupBloc.emailController.text,
              phone: signupBloc.phoneController.text,
              password: signupBloc.passOneController.text,
            ));
          }
        }
      },
      child: const DecoratedButton(title: 'Sign Up'),
    );
  }
}
