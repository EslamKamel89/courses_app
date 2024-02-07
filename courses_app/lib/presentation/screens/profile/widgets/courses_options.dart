// ignore_for_file: unused_import

import 'package:courses_app/constants/color.dart';
import 'package:courses_app/core/textstyle/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';

class CoursesQuickAcessOptions extends StatelessWidget {
  const CoursesQuickAcessOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _decoratedButton(
          title: 'My Courses',
          icon: LineIcons.video,
          onTap: () {},
        ),
        _decoratedButton(
          title: 'Buy Courses',
          icon: LineIcons.shoppingCart,
          onTap: () {},
        ),
        _decoratedButton(
          title: '4.9',
          icon: LineIcons.star,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _decoratedButton({
    required String title,
    required IconData icon,
    required void Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 90.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor1,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppColors.onBackgroundColor1,
            ),
            Txt.body(title, color: AppColors.onBackgroundColor1, size: 12.sp)
          ],
        ),
      ),
    );
  }
}
