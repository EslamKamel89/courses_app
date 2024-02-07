import 'package:courses_app/presentation/components/circular_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThirdPartyAuth extends StatelessWidget {
  const ThirdPartyAuth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {},
            child: const CircularIcon(iconName: 'google.png'),
          ),
          SizedBox(width: 25.w),
          InkWell(
            onTap: () {},
            child: const CircularIcon(iconName: 'facebook.png'),
          ),
          SizedBox(width: 25.w),
          InkWell(
            onTap: () {},
            child: const CircularIcon(iconName: 'apple.png'),
          ),
        ],
      ),
    );
  }
}
