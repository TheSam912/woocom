import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_woocom/presentation/pages/product_detail/product_detail_web.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_product_image_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_icons.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../data/models/product_model.dart';

class ProductDetailMobile extends StatefulWidget {
  ProductModel product;
  bool isWeb;
  bool isTablet;

  ProductDetailMobile({
    super.key,
    required this.product,
    required this.isWeb,
    required this.isTablet,
  });

  @override
  State<ProductDetailMobile> createState() => _ProductDetailMobileState();
}

class _ProductDetailMobileState extends State<ProductDetailMobile> {
  bool fav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(preferredSize: Size(0, 0), child: Center()),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Stack(
              children: [
                W_ProductImageSlider(
                    product: widget.product,
                    isWeb: false,
                    isTablet: widget.isTablet),
                Positioned(
                    left: 10,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.keyboard_arrow_left,
                          size: widget.isTablet ? 40 : 30,
                        )))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
              child: Column(
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
                            ? AppTextStyles.dynamicStyle(
                                fontSize: 7.sp, fontWeight: FontWeight.w700)
                            : AppTextStyles.dynamicStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    widget.product.subHeadline,
                    style: AppTextStyles.dynamicStyle(
                      fontSize: widget.isWeb
                          ? 1.4.sp
                          : widget.isTablet
                              ? 3.2.sp
                              : 13.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
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
                                  : 13.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade500,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                                fontSize: 6.sp, fontWeight: FontWeight.w700)
                            : AppTextStyles.dynamicStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Check estimated delivery date/pickup option.",
                    style: AppTextStyles.dynamicStyle(
                      fontSize: widget.isWeb
                          ? 1.sp
                          : widget.isTablet
                              ? 3.5.sp
                              : 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 60,
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.shade100,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Enter Valid Pincode",
                          style: widget.isWeb
                              ? AppTextStyles.dynamicStyle(
                                  fontSize: 0.8.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade600,
                                )
                              : widget.isTablet
                                  ? AppTextStyles.dynamicStyle(
                                      fontSize: 3.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey.shade500)
                                  : AppTextStyles.dynamicStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey.shade500),
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
                                      fontSize: 3.sp,
                                      fontWeight: FontWeight.w700,
                                      color: CupertinoColors.activeBlue)
                                  : AppTextStyles.dynamicStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w700,
                                      color: CupertinoColors.activeBlue),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      childrenPadding: EdgeInsets.zero,
                      shape: const Border(),
                      title: Text(
                        "Product Detail",
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
                                    fontSize: 5.sp, fontWeight: FontWeight.w700)
                                : AppTextStyles.dynamicStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700),
                      ),
                      initiallyExpanded: true,
                      backgroundColor: Colors.white,
                      collapsedBackgroundColor: Colors.white,
                      children: [
                        Text(
                          widget.product.description,
                          style: widget.isWeb
                              ? AppTextStyles.dynamicStyle(
                                  fontSize: 1.4.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey.shade500,
                                )
                              : widget.isTablet
                                  ? AppTextStyles.dynamicStyle(
                                      fontSize: 3.2.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey.shade500,
                                    )
                                  : AppTextStyles.dynamicStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey.shade500,
                                    ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      childrenPadding: EdgeInsets.zero,
                      shape: const Border(),
                      title: Text(
                        "Ratings & Reviews",
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
                                    fontSize: 5.sp, fontWeight: FontWeight.w700)
                                : AppTextStyles.dynamicStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700),
                      ),
                      initiallyExpanded: true,
                      backgroundColor: Colors.white,
                      collapsedBackgroundColor: Colors.white,
                      children: [
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                            itemCount: widget.product.reviews.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Card(
                                shadowColor: Colors.white,
                                color: Colors.white,
                                margin: EdgeInsets.zero,
                                elevation: 0,
                                child: ListTile(
                                  tileColor: Colors.white,
                                  title: Row(
                                    children: [
                                      Text(
                                        widget.product.reviews[index].username,
                                        style: widget.isTablet
                                            ? AppTextStyles.dynamicStyle(
                                                fontSize: 3.5.sp,
                                                fontWeight: FontWeight.w600)
                                            : const TextStyle(),
                                      ),
                                      const SizedBox(width: 8),
                                      ...List.generate(
                                        widget.product.reviews[index].rate,
                                        (i) => const Icon(Icons.star,
                                            color: Colors.amber, size: 16),
                                      ),
                                    ],
                                  ),
                                  subtitle: Text(
                                    widget.product.reviews[index].review,
                                    style: widget.isTablet
                                        ? AppTextStyles.dynamicStyle(
                                            fontSize: 3.sp,
                                            fontWeight: FontWeight.w400)
                                        : const TextStyle(),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buttonsSection(
        fav,
      ),
    );
  }

  _buttonsSection(isFav) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          children: [
            Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () => setState(() {
                    fav = !fav;
                  }),
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey.shade200),
                    alignment: Alignment.center,
                    child: Image.asset(
                      isFav ? AppIcons.wishlist_true : AppIcons.wishlist,
                    ),
                  ),
                )),
            const SizedBox(
              width: 12,
            ),
            Flexible(
                flex: 6,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.primary),
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
                                    ? 3.2.sp
                                    : 14.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ))
                    ],
                  ),
                )),
          ],
        ),
      );
}
