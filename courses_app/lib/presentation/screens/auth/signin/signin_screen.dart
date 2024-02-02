import 'package:courses_app/buisness_logic/auth/signin_bloc/signin_bloc.dart';
import 'package:courses_app/core/textstyle/text_style.dart';
import 'package:courses_app/presentation/components/appbar.dart';
import 'package:courses_app/presentation/screens/auth/signin/widgets/email_text_field.dart';
import 'package:courses_app/presentation/screens/auth/signin/widgets/forget_password.dart';
import 'package:courses_app/presentation/screens/auth/signin/widgets/login_button.dart';
import 'package:courses_app/presentation/screens/auth/signin/widgets/password_text_field.dart';
import 'package:courses_app/presentation/screens/auth/signin/widgets/signup_button.dart';
import 'package:courses_app/presentation/screens/auth/signin/widgets/third_party_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});
  late SigninBloc signinBloc;
  @override
  Widget build(BuildContext context) {
    signinBloc = context.read();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar.auth(context, 'Log in'),
      body: SingleChildScrollView(
        child: Form(
          key: signinBloc.formkey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: Column(
              children: [
                const ThirdPartyAuth(),
                Txt.display('Or Use Your Email Account To Login'),
                SizedBox(height: 40.h),
                EmailTextFeild(),
                PasswordTextField(),
                SizedBox(height: 5.h),
                const ForgetPassword(),
                SizedBox(height: 130.h),
                LoginButton(),
                SignupButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
