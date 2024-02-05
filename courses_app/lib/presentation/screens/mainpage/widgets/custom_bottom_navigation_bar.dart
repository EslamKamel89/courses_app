import 'package:courses_app/buisness_logic/mainpage/mainpage_bloc/mainpage_bloc.dart';
import 'package:courses_app/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget customBottomNavigationBar({required BuildContext context}) {
  MainpageBloc mainpageBloc = context.read();
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(width: 0.5, color: Colors.grey),
    ),
    child: BottomNavigationBar(
      currentIndex: mainpageBloc.state.index,
      onTap: (value) {
        mainpageBloc.add(MainpageEvent(index: value));
      },
      selectedItemColor: AppColors.backgroundColor1,
      selectedIconTheme: const IconThemeData(color: AppColors.backgroundColor1),
      unselectedIconTheme: const IconThemeData(color: AppColors.greyColor),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 0,
      backgroundColor: Colors.white,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
        BottomNavigationBarItem(icon: Icon(Icons.play_arrow), label: 'play'),
        BottomNavigationBarItem(icon: Icon(Icons.message_rounded), label: 'message'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'person'),
      ],
    ),
  );
}
