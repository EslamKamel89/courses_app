import 'package:courses_app/presentation/components/circular_icon.dart';
import 'package:flutter/material.dart';

class ThirdPartyAuth extends StatelessWidget {
  const ThirdPartyAuth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: const CircularIcon(iconName: 'google.png'),
        ),
        InkWell(
          onTap: () {},
          child: const CircularIcon(iconName: 'facebook.png'),
        ),
        InkWell(
          onTap: () {},
          child: const CircularIcon(iconName: 'apple.png'),
        ),
      ],
    );
  }
}
