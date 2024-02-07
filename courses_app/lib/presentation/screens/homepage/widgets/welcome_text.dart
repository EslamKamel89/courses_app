import 'package:courses_app/constants/color.dart';
import 'package:courses_app/core/textstyle/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Txt.title(
            'Hello,',
            size: 20,
            color: AppColors.greyColor.withOpacity(0.8),
            fontWeight: FontWeight.w600,
          ),
          Txt.title(
            'Eslam Kamel',
            size: 25,
            fontWeight: FontWeight.w900,
          ),
        ],
      ),
    );
  }
}
