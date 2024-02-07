import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalScrollView extends StatefulWidget {
  const HorizontalScrollView({
    super.key,
  });

  @override
  State<HorizontalScrollView> createState() => _HorizontalScrollViewState();
}

class _HorizontalScrollViewState extends State<HorizontalScrollView> {
  static List<String> imageList = [
    'Art.png',
    'Image.png',
    'image(3).png',
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360.w,
      height: 180.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 155.h,
            child: PageView.builder(
              itemCount: imageList.length,
              onPageChanged: (value) {
                currentIndex = value;
                setState(() {});
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.w)),
                    child: Image.asset(
                      'assets/icons/${imageList[index]}',
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
          ),
          DotsIndicator(
            position: currentIndex,
            dotsCount: imageList.length,
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
          )
        ],
      ),
    );
  }
}
