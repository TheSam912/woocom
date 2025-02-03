import 'package:ecommerce_woocom/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/utils/responsive_helper.dart';
import 'main_mobile.dart';
import 'main_web.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          home: LayoutBuilder(
            builder: (context, constraints) {
              if (ResponsiveHelper.isDesktop(context)) {
                return const WebHomePage();
              }
              // else if (ResponsiveHelper.isTablet(context)) {
              //   return const TabletHomePage();
              // }
              else {

                return const MobileHomePage();
              }
            },
          ),
        );
      },
    );
  }
}
