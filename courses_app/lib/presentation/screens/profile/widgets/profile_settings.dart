import 'package:courses_app/constants/color.dart';
import 'package:courses_app/core/textstyle/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            _profileSettings(
              title: 'Settings',
              icon: Icons.settings,
              onTap: () {},
            ),
            _profileSettings(
              title: 'Payment Details',
              icon: LineIcons.moneyCheck,
              onTap: () {},
            ),
            _profileSettings(
              title: 'Achivement',
              icon: LineIcons.medal,
              onTap: () {},
            ),
            _profileSettings(
              title: 'Love',
              icon: LineIcons.heart,
              onTap: () {},
            ),
            _profileSettings(
              title: 'Learning Reminders',
              icon: LineIcons.cube,
              onTap: () {},
            ),
          ],
        )
      ],
    );
  }

  Widget _profileSettings({required String title, required IconData icon, required void Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              margin: EdgeInsets.symmetric(horizontal: 15.sp),
              decoration: BoxDecoration(
                color: AppColors.backgroundColor1,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: AppColors.onBackgroundColor1,
                size: 30,
              ),
            ),
            Txt.body(title, color: AppColors.onBackgroundColor2)
          ],
        ),
      ),
    );
  }
}
