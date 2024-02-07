import 'package:courses_app/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectionOptionButtons extends StatelessWidget {
  const SelectionOptionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ColoredButton(title: 'All', onTap: () {}),
        SizedBox(width: 5.w),
        ColoredButton(title: 'Popular', onTap: () {}),
        SizedBox(width: 15.w),
        ColoredButton(title: 'Newest', onTap: () {}),
      ],
    );
  }
}

class ColoredButton extends StatefulWidget {
  ColoredButton({
    super.key,
    required this.title,
    required this.onTap,
    this.condition = false,
  });
  bool condition;
  String title;
  void Function() onTap;
  @override
  State<ColoredButton> createState() => _ColoredButtonState();
}

class _ColoredButtonState extends State<ColoredButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.condition = !widget.condition;
        widget.onTap();
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 75.w,
        decoration: BoxDecoration(
          color: widget.condition ? AppColors.backgroundColor1 : AppColors.backgroundColor2,
          borderRadius: BorderRadius.circular(20.w),
        ),
        child: Text(
          widget.title,
          style: TextStyle(
            color: widget.condition ? AppColors.onBackgroundColor1 : AppColors.greyColor,
            fontSize: 15.sp,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
