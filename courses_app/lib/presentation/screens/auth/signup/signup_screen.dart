import 'package:courses_app/buisness_logic/auth/signup_bloc/signup_bloc.dart';
import 'package:courses_app/core/extension/extensions.dart';
import 'package:courses_app/core/textstyle/text_style.dart';
import 'package:courses_app/presentation/components/appbar.dart';
import 'package:courses_app/presentation/screens/auth/signup/widgets/email_text_field.dart';
import 'package:courses_app/presentation/screens/auth/signup/widgets/passone_text_field.dart';
import 'package:courses_app/presentation/screens/auth/signup/widgets/passtwo_text_field.dart';
import 'package:courses_app/presentation/screens/auth/signup/widgets/phone_text_field.dart';
import 'package:courses_app/presentation/screens/auth/signup/widgets/signup_button.dart';
import 'package:courses_app/presentation/screens/auth/signup/widgets/user_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  late SignupBloc signupBloc;
  @override
  Widget build(BuildContext context) {
    signupBloc = context.read();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar.auth(context, 'Sign up'),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: Form(
              key: signupBloc.formKey,
              child: Column(
                children: [
                  SizedBox(width: double.infinity, height: 15.h),
                  Txt.display('Enter your details below & free sign up').cr,
                  SizedBox(height: 15.h),
                  UsenameTextField(),
                  EmailTextField(),
                  phoneTextField(),
                  PassOneTextField(),
                  PassTwoTextField(),
                  SizedBox(height: 15.h),
                  SignupButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
