import 'package:courses_app/buisness_logic/mainpage/mainpage_bloc/mainpage_bloc.dart';
import 'package:courses_app/presentation/screens/mainpage/widgets/build_pages.dart';
import 'package:courses_app/presentation/screens/mainpage/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainpageBloc, MainpageState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            // backgroundColor: Colors.white,
            // appBar: MyAppBar.mainPage(context),
            // drawer: const Drawer(),
            bottomNavigationBar: customBottomNavigationBar(context: context),
            body: buildPage(context: context, index: state.index),
          ),
        );
      },
    );
  }
}
