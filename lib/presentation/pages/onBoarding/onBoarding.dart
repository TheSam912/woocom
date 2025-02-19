import 'package:ecommerce_woocom/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF4E5),
      body: Stack(
        children: [
          Image.asset(
            AppAssets.onBoardingImage,
            fit: BoxFit.fill,
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                AppAssets.onBoardingEffect,
                fit: BoxFit.contain,
              ))
        ],
      ),
    );
  }
}
