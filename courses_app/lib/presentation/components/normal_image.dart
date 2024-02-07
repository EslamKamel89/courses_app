import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NormalIcon extends StatelessWidget {
  const NormalIcon({
    super.key,
    required this.iconName,
    this.size,
  });
  final String iconName;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 45.w,
      height: size ?? 45.w,
      margin: const EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/icons/$iconName'),
        ),
      ),
    );
  }
}
