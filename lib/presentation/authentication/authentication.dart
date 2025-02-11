import 'package:ecommerce_woocom/presentation/authentication/authentication_mobile.dart';
import 'package:ecommerce_woocom/presentation/authentication/authentication_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/responsive_helper.dart';

class Authentication extends StatelessWidget {
  const Authentication({super.key});

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
              return const AuthenticationWeb();
            } else if (ResponsiveHelper.isTablet(context)) {
              return AuthenticationMobile(
                isTablet: true,
              );
            } else {
              return AuthenticationMobile(
                isTablet: false,
              );
            }
          },
        );
      },
    );
  }
}
