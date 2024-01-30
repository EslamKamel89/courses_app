import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularImageAsset extends StatelessWidget {
  const CircularImageAsset({super.key, required this.imageName, this.size});
  final String imageName;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 45.sp,
      height: size ?? 45.sp,
      margin: const EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size ?? 45),
        image: DecorationImage(
          image: AssetImage('assets/icons/$imageName'),
        ),
      ),
    );
  }
}
