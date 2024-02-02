import 'package:courses_app/core/textstyle/text_style.dart';
import 'package:flutter/material.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({
    super.key,
    required this.onTap,
    this.alignment = Alignment.centerLeft,
    this.color = Colors.blue,
  });
  final void Function()? onTap;
  final Alignment alignment;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        alignment: Alignment.centerLeft,
        child: Txt.body(
          'Forget Password ?',
          color: Colors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
