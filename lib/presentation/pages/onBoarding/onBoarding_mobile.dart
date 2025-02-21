import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

class Onboarding_Mobile extends StatefulWidget {
  const Onboarding_Mobile({super.key, required this.isTablet});

  final bool isTablet;

  @override
  State<Onboarding_Mobile> createState() => _Onboarding_MobileState();
}

class _Onboarding_MobileState extends State<Onboarding_Mobile>
    with TickerProviderStateMixin {
  late AnimationController _imageController;
  late Animation<double> _imageAnimation;
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _imageController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _imageAnimation = Tween<double>(begin: 1.0, end: 1.10).animate(
        CurvedAnimation(parent: _imageController, curve: Curves.easeInOut));

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );
    _fadeController.forward();
  }

  @override
  void dispose() {
    _imageController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFF4E5),
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _imageAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _imageAnimation.value,
                child: SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    AppAssets.onBoardingImage,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(AppAssets.onBoardingEffect),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _startButton(context),
    );
  }

  Widget _startButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.isTablet ? 50 : 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeTransition(
            opacity: _fadeAnimation,
            child: Text(
              "The shopping\ndestination you need",
              style: AppTextStyles.dynamicStyle(
                fontSize: widget.isTablet ? 9.sp : 22.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: widget.isTablet ? 25 : 0),
          FadeTransition(
            opacity: _fadeAnimation,
            child: GestureDetector(
              onTap: () {
                context.goNamed('app');
              },
              child: Container(
                height: widget.isTablet ? 60 : 50,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.primary,
                ),
                child: Text(
                  "Get Started",
                  style: AppTextStyles.dynamicStyle(
                    fontSize: widget.isTablet ? 10 : 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          FadeTransition(
            opacity: _fadeAnimation,
            child: GestureDetector(
              onTap: () {
                context.goNamed("authentication");
              },
              child: Center(
                child: Text(
                  "I already have an account",
                  style: AppTextStyles.dynamicStyle(
                    fontSize: widget.isTablet ? 4.sp : 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: widget.isTablet ? 20 : 5),
        ],
      ),
    );
  }
}
