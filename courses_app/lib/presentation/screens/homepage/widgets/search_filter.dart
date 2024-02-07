import 'package:courses_app/presentation/components/normal_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageSearchFilter extends StatelessWidget {
  const HomePageSearchFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      child: const NormalIcon(iconName: 'filter.png'),
    );
  }
}
