import 'package:courses_app/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//- title - body - display
class Txt {
  static Text title(
    String text, {
    Color? color,
    double? size,
    TextOverflow overFlow = TextOverflow.ellipsis,
  }) {
    return Text(
      text,
      // max lines is essential so the overFlow proberity works
      maxLines: 1,
      style: TextStyle(
        fontSize: size ?? 20.sp,
        overflow: overFlow,
        color: color,
        // fontFamily: 'CairoPlay',
        fontWeight: FontWeight.w400,
      ),
    );
  }

  static Text body(
    String text, {
    Color? color,
    double? size,
    TextOverflow overFlow = TextOverflow.ellipsis,
    TextDecoration? decoration,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size ?? 16.sp,
        overflow: overFlow,
        color: color,
        // fontFamily: 'CairoPlay',
        fontWeight: FontWeight.w400,
        decoration: decoration,
        decorationThickness: 1,
        decorationColor: color,
      ),
    );
  }

  static Text display(
    String text, {
    Color color = AppColors.textLight,
    double? size,
    TextOverflow? overFlow,
    double? height,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size ?? 12.sp,
        overflow: overFlow,
        color: color,
        // fontFamily: 'CairoPlay',
        height: height ?? 1.2.sp,
      ),
    );
  }

  static Text authAppBarTxt(
    String text, {
    Color? color,
    double? size,
    TextOverflow overFlow = TextOverflow.ellipsis,
  }) {
    return Text(
      text,
      // max lines is essential so the overFlow proberity works
      maxLines: 1,
      style: TextStyle(
        fontSize: size ?? 20.sp,
        overflow: overFlow,
        color: color,
        // fontFamily: 'CairoPlay',
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static Text textFormFieldTitle(
    String text, {
    Color color = AppColors.textLight,
    double? size,
    TextOverflow? overFlow,
    double? height,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size ?? 20.sp,
        overflow: overFlow,
        color: color,
        // fontFamily: 'CairoPlay',
        height: height ?? 1.2.sp,
      ),
    );
  }
}
