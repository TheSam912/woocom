import 'package:ecommerce_woocom/core/constants/app_assets.dart';
import 'package:ecommerce_woocom/core/constants/app_colors.dart';
import 'package:ecommerce_woocom/core/constants/app_lists.dart';
import 'package:ecommerce_woocom/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/w_basket_product_item.dart';

class BasketMobile extends StatefulWidget {
  const BasketMobile({super.key, required this.isTablet});

  final bool isTablet;

  @override
  State<BasketMobile> createState() => _BasketMobileState();
}

class _BasketMobileState extends State<BasketMobile> {
  late bool isTablet;

  late bool myBag = true;
  late bool orderSummary = false;
  late bool payment = false;

  @override
  Widget build(BuildContext context) {
    isTablet = widget.isTablet;
    if (myBag) {
      return _myBagScreenDesign();
    } else {
      return _orderSummaryDesign();
    }
  }

  _myBagScreenDesign() => Scaffold(
        backgroundColor: Colors.white,
        appBar: _basketAppBar(context, "My Bag"),
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
                                  ? W_ProductItemWidget(
                                      AppLists.basketItems[index],
                                      "bag",
                                      isTablet)
                                  : const Center();
                            },
                          ),
                          SizedBox(
                            height: isTablet ? 50 : 30,
                          ),
                        ],
                      ),
                    ),
                    _priceSection()
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
                child: GestureDetector(
                  onTap: () => setState(() {
                    myBag = false;
                    orderSummary = true;
                    payment = false;
                  }),
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
                  ),
                )),
          ],
        ),
      );

  _basketAppBar(context, text) => AppBar(
        backgroundColor: Colors.white,
        title: Text(
          text,
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

  _priceSection() {
    return AppLists.basketItems.isNotEmpty
        ? Padding(
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
          )
        : const Center();
  }

  Widget _orderSummaryDesign() => Scaffold(
      backgroundColor: Colors.white,
      appBar: _basketAppBar(context, "Order Summary"),
      body: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isTablet ? 24 : 14),
            child: Text(
              "Deliver To",
              style: AppTextStyles.dynamicStyle(
                  fontSize: isTablet ? 4.sp : 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: isTablet ? 24 : 14, vertical: 14),
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.accent),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ruby S Snively",
                        style: AppTextStyles.dynamicStyle(
                            fontSize: isTablet ? 3.5.sp : 12.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      Text(
                        "1460  Jenric Lane, Ashmor Drive ",
                        style: AppTextStyles.dynamicStyle(
                            fontSize: isTablet ? 3.5.sp : 12.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade500),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.primary),
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: isTablet ? 34 : 24,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isTablet ? 24 : 14),
            child: Text(
              "Expected Delivery",
              style: AppTextStyles.dynamicStyle(
                  fontSize: isTablet ? 4.sp : 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: AppLists.basketItems.length,
            itemBuilder: (context, index) {
              return AppLists.basketItems.isNotEmpty
                  ? W_ProductItemWidget(
                      AppLists.basketItems[index], "order", isTablet)
                  : const Center();
            },
          ),
          _priceSection()
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 60,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 25, bottom: 8, left: 40, right: 40),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: AppColors.primary),
        child: DefaultTextStyle(
          style: AppTextStyles.dynamicStyle(
              fontSize: isTablet ? 4.sp : 16.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white),
          child: const Text(
            "Proceed to Payments",
          ),
        ),
      ));
}
