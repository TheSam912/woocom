import 'package:ecommerce_woocom/core/constants/app_assets.dart';
import 'package:ecommerce_woocom/core/constants/app_colors.dart';
import 'package:ecommerce_woocom/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_icons.dart';
import '../../../core/repository/product_respository.dart';

class BasketMobile extends StatelessWidget {
  const BasketMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: Text(
          "My Bag",
          style: AppTextStyles.dynamicStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
              fontSize: 16.sp),
        ),
        actions: [],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            color: AppColors.primary,
          ),
        ),
      ),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppAssets.bagBg), fit: BoxFit.fill)),
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return _productItemWidget();
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 24, right: 24, top: 20, bottom: 100),
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
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _placeOrderButton(),
    );
  }

  Widget _productItemWidget() => Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.only(bottom: 20, left: 14, right: 12),
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: 3,
                  child: Padding(
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
                ),
                Flexible(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DefaultTextStyle(
                              style: AppTextStyles.dynamicStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                              child: Text(
                                ProductRepository.productList[0].headline,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: GestureDetector(
                                  onTap: () {}, child: const Icon(Icons.close)),
                            )
                            // IconButton(
                            //     onPressed: () {}, icon: const Icon(Icons.close))
                          ],
                        ),
                        SizedBox(
                          width: 230,
                          child: DefaultTextStyle(
                            style: AppTextStyles.dynamicStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade500,
                            ),
                            child: Text(
                              ProductRepository.productList[0].subHeadline,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 12),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(AppIcons.minus),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      child: Text(
                                        "1",
                                        style: AppTextStyles.dynamicStyle(
                                            fontSize: 14.sp),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(AppIcons.plus),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: DefaultTextStyle(
                                  style: AppTextStyles.dynamicStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700),
                                  child: const Text(
                                    "55.64 \$",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Divider(
              indent: 12,
              endIndent: 12,
              color: Colors.grey.shade200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        overlayColor: WidgetStatePropertyAll(
                            AppColors.primary.withOpacity(0.5))),
                    child: Text(
                      "Move To Wishlist",
                      textAlign: TextAlign.end,
                      style: AppTextStyles.dynamicStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w700),
                    )),
                Container(
                  width: 1,
                  height: 20,
                  color: Colors.grey.shade200,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                ),
                TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        overlayColor: WidgetStatePropertyAll(
                            AppColors.primary.withOpacity(0.5))),
                    child: Text(
                      "Remove",
                      textAlign: TextAlign.end,
                      style: AppTextStyles.dynamicStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w700),
                    )),
              ],
            ),
          ],
        ),
      );

  _priceText(text, isTotal) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: DefaultTextStyle(
            style: AppTextStyles.dynamicStyle(
                fontSize: 16.sp,
                fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500),
            child: Text(text)),
      );

  _basketAppbar(context) => Container(
        color: Colors.white,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              "My Bag",
              style: AppTextStyles.dynamicStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  fontSize: 16.sp),
            ),
          ],
        ),
      );

  _placeOrderButton() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total bag amount",
                        style: AppTextStyles.dynamicStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade600),
                      ),
                      Text(
                        "111.38 \$",
                        style: AppTextStyles.dynamicStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w800,
                            color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                )),
            Flexible(
                flex: 6,
                child: Container(
                  height: 60,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 25, bottom: 8),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.primary),
                  child: DefaultTextStyle(
                    style: AppTextStyles.dynamicStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                    child: const Text(
                      "Place Order",
                    ),
                  ),
                )),
          ],
        ),
      );
}
