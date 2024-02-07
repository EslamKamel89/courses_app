import 'package:courses_app/constants/color.dart';
import 'package:courses_app/core/textstyle/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.5,
        ),
        delegate: SliverChildBuilderDelegate(
          childCount: 20,
          (BuildContext context, int index) {
            return _menuItemView(
              context: context,
              imagePath: 'assets/icons/Image.png',
              title: 'Best Course For IT',
              subtitle: '30 to 40 Lessons',
              onTap: () {},
            );
          },
        ),
      ),
    );
  }

  Widget _menuItemView({
    required BuildContext context,
    required String imagePath,
    required String title,
    required String subtitle,
    required void Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 7.w),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Txt.body(
              title,
              color: AppColors.backgroundColor2,
              maxLines: 1,
              overFlow: TextOverflow.clip,
            ),
            Txt.body(
              subtitle,
              color: AppColors.backgroundColor2,
              size: 10.sp,
              maxLines: 1,
              overFlow: TextOverflow.clip,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
