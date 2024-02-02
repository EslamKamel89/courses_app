import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({super.key, required this.iconName, this.size});
  final String iconName;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 90.w,
      height: size ?? 90.w,
      margin: const EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 20),
      decoration: BoxDecoration(
        // color: Colors.grey,
        borderRadius: BorderRadius.circular(size ?? 90.w),
        image: DecorationImage(
          image: AssetImage('assets/icons/$iconName'),
        ),
      ),
    );
  }
}
