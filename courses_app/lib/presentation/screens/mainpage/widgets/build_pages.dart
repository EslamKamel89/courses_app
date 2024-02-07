import 'package:courses_app/core/extension/extensions.dart';
import 'package:courses_app/presentation/screens/homepage/homepage.dart';
import 'package:courses_app/presentation/screens/profile/profile.dart';
import 'package:flutter/material.dart';

Widget buildPage({required BuildContext context, required int index}) {
  List<Widget> pages = [
    const Homepage(),
    const Text('Search').cr,
    const Text('Course').cr,
    const Text('Chat').cr,
    const Profile(),
  ];
  return pages[index];
}
