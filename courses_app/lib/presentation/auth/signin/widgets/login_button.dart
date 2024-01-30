import 'package:courses_app/presentation/components/decorated_button.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const DecoratedButton(title: 'Log In'),
    );
  }
}
