// MaterialText
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MaterialText extends StatelessWidget {
  const MaterialText({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.onBackgroundColor,
    this.fontSize,
    this.fontWeight,
    required this.elevation,
    this.width,
    this.height,
    this.horizntalMargin,
    this.verticalMargin,
  });
  final String title;
  final Color backgroundColor;
  final Color onBackgroundColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double elevation;
  final double? width;
  final double? height;
  final double? horizntalMargin;
  final double? verticalMargin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.symmetric(vertical: verticalMargin ?? 5.h, horizontal: horizntalMargin ?? 5.w),
      width: width,
      height: height,
      child: Material(
        elevation: elevation,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: backgroundColor,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: onBackgroundColor,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
