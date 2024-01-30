import 'package:courses_app/constants/color/color.dart';
import 'package:courses_app/presentation/components/decorated_button.dart';
import 'package:flutter/material.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const DecoratedButton(
        title: 'Sign Up',
        onBackgroundColor: AppColors.onBackgroundColor2,
        backgroundColor: AppColors.backgroundColor2,
      ),
    );
  }
}
