import 'package:courses_app/constants/color.dart';
import 'package:courses_app/core/textstyle/text_style.dart';
import 'package:courses_app/presentation/components/circular_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  static AppBar mainPage(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: AppColors.backgroundColor2,
      // backgroundColor: Colors.grey,
      toolbarHeight: 100.h,
      actions: const [
        CircularIcon(iconName: 'img.png'),
      ],
    );
  }
}
