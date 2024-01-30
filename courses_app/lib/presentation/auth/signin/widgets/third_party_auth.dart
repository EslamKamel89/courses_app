import 'package:courses_app/presentation/components/circular_image_asset.dart';
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
          child: const CircularImageAsset(imageName: 'google.png'),
        ),
        InkWell(
          onTap: () {},
          child: const CircularImageAsset(imageName: 'facebook.png'),
        ),
        InkWell(
          onTap: () {},
          child: const CircularImageAsset(imageName: 'apple.png'),
        ),
      ],
    );
  }
}
