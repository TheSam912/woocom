import 'package:ecommerce_woocom/core/constants/app_assets.dart';
import 'package:ecommerce_woocom/core/constants/app_colors.dart';
import 'package:ecommerce_woocom/core/constants/app_icons.dart';
import 'package:ecommerce_woocom/data/models/product_model.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_product_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_text_styles.dart';
import '../../widgets/w_appbar.dart';
import '../../widgets/w_web_footer.dart';

class ProductDetailWeb extends StatefulWidget {
  ProductModel product;
  bool isWeb;
  bool isTablet;

  ProductDetailWeb({
    super.key,
    required this.product,
    required this.isWeb,
    required this.isTablet,
  });

  @override
  State<ProductDetailWeb> createState() => _ProductDetailWebState();
}

class _ProductDetailWebState extends State<ProductDetailWeb> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: widget.isWeb
          ? wAppBarWeb(context)
          : const PreferredSize(preferredSize: Size(0, 0), child: Center()),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                    flex: 4,
                    fit: FlexFit.loose,
                    child: Container(
                      height: 550,
                      alignment: Alignment.topCenter,
                      margin: const EdgeInsets.only(left: 25),
                      child: Image.asset(widget.product.images[0]),
                    )),
                const SizedBox(
                  width: 30,
                ),
                Flexible(
                    flex: 6,
                    fit: FlexFit.loose,
                    child: Container(
                      height: 600,
                      width: double.infinity,
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.only(top: 30),
                      margin: const EdgeInsets.only(right: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              _titleRatingSection(),
                              _priceSection(),
                              Divider(
                                color: Colors.grey.shade200,
                                thickness: 2,
                              ),
                              _deliverySection(),
                              const SizedBox(
                                height: 12,
                              ),
                              _quantitySection(),
                              const SizedBox(
                                height: 12,
                              ),
                            ],
                          ),
                          _buttonsSection()
                        ],
                      ),
                    )),
              ],
            ),
            W_ProductTabs(
              product: widget.product,
            ),
            w_WebFooter()
          ],
        ),
      ),
    );
  }

  _titleRatingSection() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.product.headline,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: widget.isWeb
                ? AppTextStyles.dynamicStyle(
                    fontSize: 2.2.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )
                : widget.isTablet
                    ? AppTextStyles.dynamicStyle(fontSize: 4.sp, fontWeight: FontWeight.w700)
                    : AppTextStyles.dynamicStyle(fontSize: 13.sp, fontWeight: FontWeight.w700),
          ),
          Text(
            widget.product.subHeadline,
            style: AppTextStyles.dynamicStyle(
              fontSize: widget.isWeb
                  ? 1.4.sp
                  : widget.isTablet
                      ? 3.sp
                      : 8.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/Ratings.png",
                  width: 150,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  "(250) rating",
                  style: AppTextStyles.dynamicStyle(
                    fontSize: widget.isWeb
                        ? 1.sp
                        : widget.isTablet
                            ? 3.sp
                            : 8.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade500,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      );

  _buttonsSection() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 30),
        child: Row(
          children: [
            Flexible(
                flex: 6,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8), color: AppColors.primary),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppIcons.bag,
                        color: Colors.white,
                        width: 25,
                        height: 25,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text("Add To Bag",
                          style: AppTextStyles.dynamicStyle(
                            fontSize: widget.isWeb
                                ? 1.sp
                                : widget.isTablet
                                    ? 3.sp
                                    : 8.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ))
                    ],
                  ),
                )),
            const SizedBox(
              width: 20,
            ),
            Flexible(
                flex: 4,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      border: Border.all(color: AppColors.primary, width: 1)),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppIcons.wishlist,
                        width: 25,
                        height: 25,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text("Add To Wishlist",
                          style: AppTextStyles.dynamicStyle(
                            fontSize: widget.isWeb
                                ? 1.sp
                                : widget.isTablet
                                    ? 3.sp
                                    : 8.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ))
                    ],
                  ),
                ))
          ],
        ),
      );

  _quantitySection() => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          children: [
            Text(
              "Quantity:",
              style: widget.isWeb
                  ? AppTextStyles.dynamicStyle(
                      fontSize: 1.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )
                  : widget.isTablet
                      ? AppTextStyles.dynamicStyle(fontSize: 4.sp, fontWeight: FontWeight.w700)
                      : AppTextStyles.dynamicStyle(fontSize: 13.sp, fontWeight: FontWeight.w700),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              margin: const EdgeInsets.only(left: 12),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_quantity != 1) {
                          _quantity = _quantity - 1;
                        }
                      });
                    },
                    child: Image.asset(AppIcons.minus),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(_quantity.toString()),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_quantity != 5) {
                          _quantity = _quantity + 1;
                        }
                      });
                    },
                    child: Image.asset(AppIcons.plus),
                  ),
                ],
              ),
            )
          ],
        ),
      );

  _priceSection() => Row(
        children: [
          Text("${widget.product.price} \$",
              style: widget.product.priceSale == 0.0
                  ? widget.isWeb
                      ? AppTextStyles.dynamicStyle(fontSize: 2.sp, fontWeight: FontWeight.w700)
                      : widget.isTablet
                          ? AppTextStyles.dynamicStyle(fontSize: 3.sp, fontWeight: FontWeight.w700)
                          : AppTextStyles.dynamicStyle(fontSize: 10.sp, fontWeight: FontWeight.w700)
                  : widget.isWeb
                      ? AppTextStyles.productPriceSaleDetail
                      : widget.isTablet
                          ? AppTextStyles.productPriceSaleTablet
                          : AppTextStyles.productPriceSaleMobile),
          const SizedBox(width: 20),
          widget.product.priceSale != 0.0
              ? Text(
                  "${39.99} \$",
                  style: widget.isWeb
                      ? AppTextStyles.dynamicStyle(fontSize: 2.sp, fontWeight: FontWeight.w700)
                      : widget.isTablet
                          ? AppTextStyles.dynamicStyle(fontSize: 3.sp, fontWeight: FontWeight.w700)
                          : AppTextStyles.dynamicStyle(
                              fontSize: 10.sp, fontWeight: FontWeight.w700),
                )
              : const Center(),
        ],
      );

  _deliverySection() => Row(
        children: [
          Flexible(
              flex: 4,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Delivery Detail",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: widget.isWeb
                          ? AppTextStyles.dynamicStyle(
                              fontSize: 1.4.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            )
                          : widget.isTablet
                              ? AppTextStyles.dynamicStyle(
                                  fontSize: 4.sp, fontWeight: FontWeight.w700)
                              : AppTextStyles.dynamicStyle(
                                  fontSize: 13.sp, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Check estimated delivery \ndate/pickup option.",
                      style: AppTextStyles.dynamicStyle(
                        fontSize: widget.isWeb
                            ? 1.sp
                            : widget.isTablet
                                ? 3.sp
                                : 8.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              )),
          Flexible(
              flex: 6,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.shade100,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Apply Valid Pincode",
                          style: widget.isWeb
                              ? AppTextStyles.dynamicStyle(
                                  fontSize: 0.8.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade600,
                                )
                              : widget.isTablet
                                  ? AppTextStyles.dynamicStyle(
                                      fontSize: 4.sp, fontWeight: FontWeight.w700)
                                  : AppTextStyles.dynamicStyle(
                                      fontSize: 13.sp, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Check",
                          style: widget.isWeb
                              ? AppTextStyles.dynamicStyle(
                                  fontSize: 0.8.sp,
                                  fontWeight: FontWeight.w700,
                                  color: CupertinoColors.activeBlue,
                                )
                              : widget.isTablet
                                  ? AppTextStyles.dynamicStyle(
                                      fontSize: 4.sp, fontWeight: FontWeight.w700)
                                  : AppTextStyles.dynamicStyle(
                                      fontSize: 13.sp, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  )
                ],
              ))
        ],
      );
}
