import 'package:courses_app/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    this.controller,
  });
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          hintText: 'Search Your Courses',
          hintStyle: const TextStyle(fontSize: 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.w),
            borderSide: const BorderSide(color: AppColors.greyColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.w),
            borderSide: const BorderSide(color: AppColors.greyColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.w),
            borderSide: const BorderSide(color: AppColors.backgroundColor1, width: 2, style: BorderStyle.solid),
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.greyColor,
            // size: 5,
          )),
    );
  }
}
