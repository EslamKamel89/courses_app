// MaterialContainer
import 'package:flutter/material.dart';

class MaterialContainer extends StatelessWidget {
  const MaterialContainer({
    super.key,
    required this.child,
    required this.backgroundColor,
    this.fontSize,
    this.fontWeight,
    required this.elevation,
    this.width,
    this.height,
    this.horizntalMargin,
    this.verticalMargin,
  });
  final Widget child;
  final Color backgroundColor;
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
      margin: EdgeInsetsDirectional.symmetric(vertical: verticalMargin ?? 5, horizontal: horizntalMargin ?? 5),
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
          child: child,
        ),
      ),
    );
  }
}
