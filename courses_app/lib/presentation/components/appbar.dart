import 'package:courses_app/constants/color/color.dart';
import 'package:courses_app/core/textstyle/text_style.dart';
import 'package:flutter/material.dart';

class MyAppBar {
  static AppBar auth(BuildContext context, String title) {
    return AppBar(
      title: Txt.authAppBarTxt(title),
      elevation: 0.0,
      backgroundColor: AppColors.backgroundColor2,
      centerTitle: true,
      shape: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.secondryElementColor2,
        ),
      ),
      // foregroundColor: Colors.grey,
    );
  }
}
