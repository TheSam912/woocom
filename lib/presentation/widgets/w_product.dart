import 'package:ecommerce_woocom/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_text_styles.dart';

class W_ProductWidget extends StatelessWidget {
  W_ProductWidget(
      {super.key,
      required this.item,
      required this.isTablet,
      required this.isWeb});

  ProductModel item;
  bool isWeb;
  bool isTablet;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          "product_detail",
          extra: {
            "product": item,
          },
        );
      },
      child: Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(item.images[0]),
            Text(
              item.headline,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: isWeb
                  ? AppTextStyles.dynamicStyle(
                      fontSize: 1.5.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )
                  : isTablet
                      ? AppTextStyles.dynamicStyle(
                          fontSize: 3.sp, fontWeight: FontWeight.w700)
                      : AppTextStyles.dynamicStyle(
                          fontSize: 13.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                item.subHeadline,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: isWeb
                    ? AppTextStyles.dynamicStyle(
                        fontSize: 1.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade500,
                      )
                    : isTablet
                        ? AppTextStyles.dynamicStyle(
                            fontSize: 2.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey.shade600)
                        : AppTextStyles.dynamicStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey.shade600),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text("${item.price} \$",
                    style: item.priceSale == 0.0
                        ? isWeb
                            ? AppTextStyles.productPriceNormal
                            : isTablet
                                ? AppTextStyles.dynamicStyle(
                                    fontSize: 3.sp, fontWeight: FontWeight.w700)
                                : AppTextStyles.dynamicStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w700)
                        : isWeb
                            ? AppTextStyles.productPriceSale
                            : isTablet
                                ? AppTextStyles.productPriceSaleTablet
                                : AppTextStyles.productPriceSaleMobile),
                const SizedBox(width: 8),
                item.priceSale != 0.0
                    ? Text("${item.priceSale} \$",
                        style: isWeb
                            ? AppTextStyles.productPriceNormal
                            : isTablet
                                ? AppTextStyles.dynamicStyle(
                                    fontSize: 3.sp, fontWeight: FontWeight.w700)
                                : AppTextStyles.dynamicStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w700))
                    : const Center(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
