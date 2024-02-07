import 'package:courses_app/presentation/components/appbar.dart';
import 'package:courses_app/presentation/screens/profile/widgets/courses_options.dart';
import 'package:courses_app/presentation/screens/profile/widgets/profile_settings.dart';
import 'package:courses_app/presentation/screens/profile/widgets/user_image_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.profile(context, title: 'Profile'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 15.h, bottom: 15.h),
          child: ListView(
            children: [
              const UserImageAndEditButton(imageName: '02.png', userName: 'Eslam Kamel'),
              SizedBox(height: 25.h),
              const CoursesQuickAcessOptions(),
              SizedBox(height: 35.h),
              const ProfileSettings(),
            ],
          ),
        ),
      ),
    );
  }
}
