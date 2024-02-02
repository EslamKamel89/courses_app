import 'package:courses_app/core/extension/extensions.dart';
import 'package:flutter/material.dart';

Widget buildPage({required BuildContext context, required int index}) {
  List<Widget> pages = [
    const Text('Home').cr,
    const Text('Search').cr,
    const Text('Course').cr,
    const Text('Chat').cr,
    const Text('Profile').cr,
  ];
  return pages[index];
}
