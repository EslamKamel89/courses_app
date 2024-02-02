import 'package:courses_app/buisness_logic/auth/signin_bloc/signin_bloc.dart';
import 'package:courses_app/constants/color/color.dart';
import 'package:courses_app/presentation/components/decorated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupButton extends StatelessWidget {
  SignupButton({
    super.key,
  });
  late SigninBloc signinBloc;
  @override
  Widget build(BuildContext context) {
    signinBloc = context.read();
    return InkWell(
      onTap: () {
        signinBloc.add(GoToSignupEvent(context: context));
      },
      child: const DecoratedButton(
        title: 'Sign Up',
        onBackgroundColor: AppColors.onBackgroundColor2,
        backgroundColor: AppColors.backgroundColor2,
      ),
    );
  }
}
