import 'package:ecommerce_woocom/presentation/pages/admin/admin_web.dart';
import 'package:ecommerce_woocom/presentation/pages/main/main_mobile.dart';
import 'package:ecommerce_woocom/presentation/pages/main/main_tablet.dart';
import 'package:ecommerce_woocom/presentation/pages/main/main_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/utils/responsive_helper.dart';

class App extends StatelessWidget {
  const App({super.key});

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
              // return const AdminWeb();
              return const WebHomePage();
            } else if (ResponsiveHelper.isTablet(context)) {
              return TabletHomePage();
            } else {
              return MobileHomePage();
            }
          },
        );
      },
    );
  }
}
