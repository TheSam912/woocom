import 'package:ecommerce_woocom/core/constants/app_assets.dart';
import 'package:ecommerce_woocom/core/constants/app_colors.dart';
import 'package:ecommerce_woocom/core/constants/app_lists.dart';
import 'package:ecommerce_woocom/core/constants/app_text_styles.dart';
import 'package:ecommerce_woocom/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_icons.dart';
import '../../../core/utils/responsive_helper.dart';

class BasketMobile extends StatelessWidget {
  BasketMobile({super.key});

  late bool isTablet;

  @override
  Widget build(BuildContext context) {
    isTablet = ResponsiveHelper.isTablet(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _basketAppBar(context),
      body: AppLists.basketItems.isNotEmpty
          ? Container(
              margin: EdgeInsets.all(isTablet ? 60 : 0),
              padding: EdgeInsets.all(isTablet ? 8 : 0),
              child: ListView(
                physics: const ClampingScrollPhysics(),
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                            image: AssetImage(AppAssets.bagBg),
                            fit: BoxFit.fill)),
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: AppLists.basketItems.length,
                          itemBuilder: (context, index) {
                            return AppLists.basketItems.isNotEmpty
                                ? _productItemWidget(
                                    AppLists.basketItems[index])
                                : Center();
                          },
                        ),
                        SizedBox(
                          height: isTablet ? 50 : 30,
                        ),
                      ],
                    ),
                  ),
                  AppLists.basketItems.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 24, right: 24, top: 20, bottom: 100),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _priceText("Subtotal", false),
                                  _priceText("109.38 \$", false),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _priceText("Tax", false),
                                  _priceText("2 \$", false),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _priceText("Total", true),
                                  _priceText("111.38 \$", true),
                                ],
                              ),
                            ],
                          ),
                        )
                      : const Center(),
                ],
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.empty_basket,
                    height: isTablet ? 300 : 250,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Uh Oh....!",
                    style: AppTextStyles.dynamicStyle(
                        fontSize: isTablet ? 8.sp : 20.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: Text(
                      isTablet
                          ? "You haven’t added any any items.\n Start shopping to make your bag bloom"
                          : "You haven’t added any any items. Start shopping to make your bag bloom",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.dynamicStyle(
                          fontSize: isTablet ? 4.sp : 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AppLists.basketItems.isNotEmpty
          ? _placeOrderButton()
          : _continueShoppingButton(context),
    );
  }

  Widget _productItemWidget(ProductModel index) => Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.only(bottom: 20, left: 14, right: 12),
        padding: const EdgeInsets.only(top: 16),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  flex: isTablet ? 2 : 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        index.images[0],
                        fit: BoxFit.contain,
                        width: isTablet ? 150 : 100,
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
                                  fontSize: isTablet ? 5.sp : 14.sp,
                                  fontWeight: FontWeight.w600),
                              child: Text(
                                index.headline,
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
                        Container(
                          width: isTablet ? double.infinity : 230,
                          margin: EdgeInsets.only(right: isTablet ? 30 : 0),
                          child: DefaultTextStyle(
                            style: AppTextStyles.dynamicStyle(
                              fontSize: isTablet ? 4.sp : 10.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade500,
                            ),
                            child: Text(
                              index.subHeadline,
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
                                            fontSize: isTablet ? 4.sp : 14.sp),
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
                                      fontSize: isTablet ? 4.sp : 12.sp,
                                      fontWeight: FontWeight.w700),
                                  child: Text(
                                    "${index.price} \$",
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
                          fontSize: isTablet ? 4.sp : 12.sp,
                          fontWeight: FontWeight.w700),
                    )),
                Container(
                  width: 1,
                  height: 20,
                  color: Colors.grey.shade200,
                  margin: EdgeInsets.symmetric(horizontal: isTablet ? 80 : 30),
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
                          fontSize: isTablet ? 4.sp : 12.sp,
                          fontWeight: FontWeight.w700),
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
                fontSize: isTablet ? 4.sp : 16.sp,
                fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500),
            child: Text(text)),
      );

  _placeOrderButton() => Padding(
        padding: EdgeInsets.symmetric(horizontal: isTablet ? 90 : 16),
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
                            fontSize: isTablet ? 3.sp : 13.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade600),
                      ),
                      Text(
                        "111.38 \$",
                        style: AppTextStyles.dynamicStyle(
                            fontSize: isTablet ? 3.5.sp : 14.sp,
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
                        fontSize: isTablet ? 4.sp : 16.sp,
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

  _basketAppBar(context) => AppBar(
        backgroundColor: AppLists.basketItems.isNotEmpty
            ? isTablet
                ? Colors.white
                : Colors.grey.shade100
            : Colors.white,
        title: Text(
          "My Bag",
          style: AppTextStyles.dynamicStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
              fontSize: isTablet ? 5.sp : 16.sp),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            color: AppColors.primary,
          ),
        ),
      );

  _continueShoppingButton(context) => GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          height: 60,
          alignment: Alignment.center,
          margin: EdgeInsets.only(
              top: 25,
              bottom: 8,
              left: isTablet ? 34 : 24,
              right: isTablet ? 34 : 24),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppColors.primary),
          child: DefaultTextStyle(
            style: AppTextStyles.dynamicStyle(
                fontSize: isTablet ? 4.sp : 16.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white),
            child: const Text(
              "Continue Shopping",
            ),
          ),
        ),
      );
}
