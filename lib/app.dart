import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/utils/responsive_helper.dart';
import 'presentation/responsive/main_mobile.dart';
import 'presentation/responsive/main_tablet.dart';
import 'presentation/responsive/main_web.dart';

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
              return const WebHomePage();
            } else if (ResponsiveHelper.isTablet(context)) {
              return const TabletHomePage();
            } else {
              return const MobileHomePage();
            }
          },
        );
      },
    );
  }
}
