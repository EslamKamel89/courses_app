import 'package:courses_app/core/textstyle/text_style.dart';
import 'package:flutter/material.dart';

class SeeAllButton extends StatelessWidget {
  const SeeAllButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () {}, child: Txt.display('See all'));
  }
}
