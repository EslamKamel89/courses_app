import 'package:courses_app/constants/color.dart';
import 'package:courses_app/presentation/components/material_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DecoratedButton extends StatelessWidget {
  const DecoratedButton({
    super.key,
    required this.title,
    this.backgroundColor = AppColors.backgroundColor1,
    this.onBackgroundColor = AppColors.onBackgroundColor1,
  });
  final String title;
  final Color backgroundColor;
  final Color onBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return MaterialText(
      title: title,
      backgroundColor: backgroundColor,
      onBackgroundColor: onBackgroundColor,
      elevation: 30,
      horizntalMargin: 30.w,
    );
  }
}
