import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularIcon extends StatelessWidget {
  const CircularIcon({super.key, required this.iconName, this.size, this.child, this.childAlignment});
  final String iconName;
  final double? size;
  final Widget? child;
  final AlignmentGeometry? childAlignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 60.w,
      height: size ?? 60.w,
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        // color: Colors.grey,
        borderRadius: BorderRadius.circular(size ?? 60.w),
        image: DecorationImage(
          image: AssetImage('assets/icons/$iconName'),
        ),
      ),
      alignment: childAlignment,
      child: child,
    );
  }
}
