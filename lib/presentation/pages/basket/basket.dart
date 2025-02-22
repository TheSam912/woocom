import 'package:ecommerce_woocom/presentation/pages/basket/basket_mobile.dart';
import 'package:ecommerce_woocom/presentation/pages/basket/basket_mobile.dart';
import 'package:ecommerce_woocom/presentation/pages/basket/basket_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/responsive_helper.dart';

class Basket extends StatelessWidget {
  const Basket({super.key});

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
              return const W_BasketWeb();
            } else if (ResponsiveHelper.isTablet(context)) {
              return const BasketMobile(
                isTablet: true,
              );
            } else {
              return const BasketMobile(
                isTablet: false,
              );
            }
          },
        );
      },
    );
  }
}
