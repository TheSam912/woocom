import 'package:ecommerce_woocom/presentation/pages/category/category_mobile.dart';
import 'package:ecommerce_woocom/presentation/pages/category/category_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/responsive_helper.dart';

class Category extends StatelessWidget {
  const Category({super.key});

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
              return CategoryWeb();
            } else if (ResponsiveHelper.isTablet(context)) {
              return CategoryMobile(
                isTablet: true,
              );
            } else {
              return CategoryMobile(
                isTablet: false,
              );
            }
          },
        );
      },
    );
  }
}
