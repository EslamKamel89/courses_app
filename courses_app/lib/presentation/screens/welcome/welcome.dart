// ignore_for_file: unused_import

import 'package:courses_app/buisness_logic/welcome_bloc/welcome_bloc.dart';
import 'package:courses_app/buisness_logic/welcome_bloc/welcome_events.dart';
import 'package:courses_app/buisness_logic/welcome_bloc/welcome_states.dart';
import 'package:courses_app/constants/sharedpreference_key.dart';
import 'package:courses_app/core/extension/extensions.dart';
import 'package:courses_app/core/global/global.dart';
import 'package:courses_app/core/router/app_routes_names.dart';
import 'package:courses_app/data/data_provider/static/onboarding_data.dart';
import 'package:courses_app/data/models/onBoarding.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late WelcomeBloc welcomeBloc;
  @override
  Widget build(BuildContext context) {
    welcomeBloc = context.read();
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
                // width: 375.w,
                margin: EdgeInsets.only(top: 34.h),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    PageView(
                      controller: welcomeBloc.pageController,
                      onPageChanged: (index) {
                        state.page = index;
                        context.read<WelcomeBloc>().add(WelcomeEvent());
                      },
                      children: [
                        pageBuilder(
                          context: context,
                          onBoarding: onBoardingData[0],
                        ),
                        pageBuilder(
                          context: context,
                          onBoarding: onBoardingData[1],
                        ),
                        pageBuilder(
                          context: context,
                          onBoarding: onBoardingData[2],
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 100.h,
                      child: DotsIndicator(
                        position: state.page,
                        dotsCount: 3,
                        mainAxisAlignment: MainAxisAlignment.center,
                        decorator: DotsDecorator(
                          color: Colors.grey,
                          activeColor: Colors.blue,
                          size: Size.square(5.w),
                          activeSize: Size(18.w, 8.w),
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    )
                  ],
                ));
          },
        ),
      ),
    );
  }

  Column pageBuilder({
    required BuildContext context,
    required OnBoarding onBoarding,
  }) {
    return Column(
      children: [
        SizedBox(
          // color: Colors.grey,
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            'assets/images/${onBoarding.imageName}.png',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 345.w,
          child: Text(
            onBoarding.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: 345.w,
          padding: EdgeInsets.only(left: 35.w, right: 35.w),
          child: Text(
            onBoarding.subtitle,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        GestureDetector(
          onTap: () {
            if (onBoarding.index <= 2) {
              'Navigate to the next page'.prt;
              welcomeBloc.pageController.animateToPage(
                onBoarding.index,
                duration: const Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
              );
            } else {
              'Last page arrived exit onBoarding '.prt;
              GlobalServices.localStorage.inst.setBool(AppStorageKey.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
              Navigator.of(context).pushNamedAndRemoveUntil(AppRoutesNames.signin, (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 345.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20.w),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Text(
              onBoarding.buttonName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
              ),
            ).cr,
          ),
        )
      ],
    );
  }
}
