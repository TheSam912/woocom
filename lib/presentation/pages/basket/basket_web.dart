import 'package:ecommerce_woocom/core/repository/product_respository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_icons.dart';
import '../../../core/constants/app_text_styles.dart';

w_BasketDialog(context) => Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade200.withOpacity(0.5),
      ),
      margin: const EdgeInsets.only(right: 25, top: 70),
      alignment: Alignment.topRight,
      child: Container(
        height: 605,
        width: 400,
        color: Colors.white,
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                AppAssets.productImage1,
                                fit: BoxFit.contain,
                                width: 100,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 270,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      DefaultTextStyle(
                                        style: AppTextStyles.dynamicStyle(
                                            fontSize: 1.sp,
                                            fontWeight: FontWeight.w600),
                                        child: Text(
                                          ProductRepository
                                              .productList[0].headline,
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.close))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 250,
                                  child: DefaultTextStyle(
                                    style: AppTextStyles.dynamicStyle(
                                      fontSize: 0.8.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey.shade500,
                                    ),
                                    child: Text(
                                      ProductRepository
                                          .productList[0].subHeadline,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 250,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        margin: const EdgeInsets.only(top: 12),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {},
                                              child:
                                                  Image.asset(AppIcons.minus),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              child: Text(
                                                "1",
                                                style:
                                                    AppTextStyles.dynamicStyle(
                                                        fontSize: 0.7.sp),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {},
                                              child: Image.asset(AppIcons.plus),
                                            ),
                                          ],
                                        ),
                                      ),
                                      DefaultTextStyle(
                                        style: AppTextStyles.dynamicStyle(
                                            fontSize: 1.sp,
                                            fontWeight: FontWeight.w700),
                                        child: const Text(
                                          "55.64 \$",
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Divider(
                        color: Colors.grey.shade200,
                        indent: 12,
                        endIndent: 12,
                      ),
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _priceText("Subtotal", false),
                      _priceText("109.38 \$", false),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _priceText("Tax", false),
                      _priceText("2 \$", false),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _priceText("Total", true),
                      _priceText("111.38 \$", true),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 12, right: 12, top: 25),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.primary),
                child: DefaultTextStyle(
                  style: AppTextStyles.dynamicStyle(
                      fontSize: 0.9.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                  child: const Text(
                    "Place Order",
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );

_priceText(text, isTotal) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: DefaultTextStyle(
          style: AppTextStyles.dynamicStyle(
              fontSize: 1.sp,
              fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500),
          child: Text(text)),
    );
