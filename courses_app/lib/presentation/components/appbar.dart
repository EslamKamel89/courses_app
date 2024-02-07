import 'package:courses_app/constants/color.dart';
import 'package:courses_app/core/extension/extensions.dart';
import 'package:courses_app/core/textstyle/text_style.dart';
import 'package:courses_app/presentation/components/circular_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppBar {
  static AppBar auth(BuildContext context, String title) {
    return AppBar(
      title: Txt.authAppBarTxt(title),
      elevation: 0.0,
      backgroundColor: AppColors.backgroundColor2,
      centerTitle: true,
      shape: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.secondryElementColor2,
        ),
      ),
      // foregroundColor: Colors.grey,
    );
  }

  static AppBar homepage(
    BuildContext context, {
    void Function()? menuOnTap,
    void Function()? personOnTap,
  }) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: AppColors.backgroundColor2,
      // backgroundColor: Colors.grey,
      toolbarHeight: 50.h,
      title: Column(
        children: [
          SizedBox(height: 10.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: menuOnTap,
                child: CircularIcon(
                  iconName: 'menu.png',
                  size: 40.w,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: personOnTap ?? () => 'Reloading Completed'.prt,
                child: CircularIcon(
                  iconName: 'img.png',
                  size: 40.w,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
