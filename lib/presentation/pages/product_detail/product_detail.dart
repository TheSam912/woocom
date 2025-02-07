import 'package:ecommerce_woocom/presentation/pages/product_detail/product_detail_mobile.dart';
import 'package:ecommerce_woocom/presentation/pages/product_detail/product_detail_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/responsive_helper.dart';
import '../../../data/models/product_model.dart';

class ProductDetail extends StatelessWidget {
  ProductModel product;

  ProductDetail({
    super.key,
    required this.product,
  });

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
              return ProductDetailWeb(product: product, isWeb: true, isTablet: false);
            } else if (ResponsiveHelper.isTablet(context)) {
              return ProductDetailMobile(product: product, isWeb: false, isTablet: true);
            } else {
              return ProductDetailMobile(product: product, isWeb: false, isTablet: false);
            }
          },
        );
      },
    );
  }
}
