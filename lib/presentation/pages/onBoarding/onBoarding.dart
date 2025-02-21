import 'package:ecommerce_woocom/app.dart';
import 'package:ecommerce_woocom/presentation/pages/onBoarding/onBoarding_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/responsive_helper.dart';
import '../main/main_web.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            if (ResponsiveHelper.isDesktop(context)) {
              return const App();
            } else if (ResponsiveHelper.isTablet(context)) {
              return Onboarding_Mobile(
                isTablet: true,
              );
            } else {
              return Onboarding_Mobile(
                isTablet: false,
              );
            }
          },
        );
      },
    );
  }
}
