import 'package:ecommerce_woocom/core/constants/app_assets.dart';
import 'package:ecommerce_woocom/core/constants/app_colors.dart';
import 'package:ecommerce_woocom/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class Onboarding_Mobile extends StatelessWidget {
  Onboarding_Mobile({super.key, required this.isTablet});

  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF4E5),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              AppAssets.onBoardingImage,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                AppAssets.onBoardingEffect,
                fit: BoxFit.contain,
              )),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _startButton(context),
    );
  }

  _startButton(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: isTablet ? 50 : 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "The shopping\ndestination you need",
              style: AppTextStyles.dynamicStyle(
                  fontSize: isTablet ? 9.sp : 22.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            SizedBox(
              height: isTablet ? 25 : 0,
            ),
            GestureDetector(
              onTap: () {
                // context.pushNamed('app');
                context.goNamed('app');
              },
              child: Container(
                height: isTablet ? 60 : 50,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.primary),
                child: Text(
                  "Get Started",
                  style: AppTextStyles.dynamicStyle(
                      fontSize: isTablet ? 10 : 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: isTablet ? 25 : 0,
            ),
            GestureDetector(
              onTap: () {
                context.pushNamed("authentication");
                context.pop(context);
              },
              child: Center(
                child: Text(
                  "I already have an account",
                  style: AppTextStyles.dynamicStyle(
                      fontSize: isTablet ? 4.sp : 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: isTablet ? 25 : 5,
            )
          ],
        ),
      );
}
