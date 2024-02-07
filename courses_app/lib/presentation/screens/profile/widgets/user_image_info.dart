import 'package:courses_app/core/textstyle/text_style.dart';
import 'package:courses_app/presentation/components/circular_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserImageAndEditButton extends StatelessWidget {
  const UserImageAndEditButton({
    super.key,
    required this.imageName,
    required this.userName,
  });
  final String imageName;
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularIcon(
          iconName: imageName,
          size: 100,
          childAlignment: Alignment.bottomRight,
          child: InkWell(
            onTap: () {},
            child: Image.asset('assets/icons/edit_3.png', width: 30.w, height: 30.w),
          ),
        ),
        Txt.title(userName),
      ],
    );
  }
}
