import 'package:ecommerce_woocom/core/constants/app_colors.dart';
import 'package:ecommerce_woocom/core/constants/app_text_styles.dart';
import 'package:ecommerce_woocom/data/models/product_model.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_iconButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_icons.dart';
import '../../core/repository/product_respository.dart';

class W_ProductTabs extends StatefulWidget {
  W_ProductTabs({super.key, required this.product});

  ProductModel product;

  @override
  State<W_ProductTabs> createState() => _ProductTabsState();
}

class _ProductTabsState extends State<W_ProductTabs> {
  int _selectedIndex = 0;
  final List<String> _tabs = [
    "Product Detail",
    "Related Products",
    "Ratings and Reviews"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(_tabs.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: _selectedIndex == index
                          ? AppColors.primary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      _tabs[index],
                      style: AppTextStyles.dynamicStyle(
                          color: _selectedIndex == index
                              ? Colors.white
                              : Colors.grey.shade500,
                          fontWeight: FontWeight.w600,
                          fontSize: 1.1.sp),
                    ),
                  ),
                );
              }),
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: _getTabContent(_selectedIndex),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getTabContent(int index) {
    switch (index) {
      case 0:
        return _buildDetailTab();
      case 1:
        return _buildRelatedTab(true, false);
      case 2:
        return _buildReviewsTab();
      default:
        return Container();
    }
  }

  Widget _buildDetailTab() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Text(
        widget.product.description,
        style: AppTextStyles.dynamicStyle(
            fontSize: 1.2.sp,
            color: Colors.grey.shade800,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildRelatedTab(isWeb, isTablet) {
    return Container(
      height: 370,
      margin: const EdgeInsets.only(top: 12),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          var item = ProductRepository.productList[0];
          return Container(
            margin: index == 0
                ? EdgeInsets.only(right: isWeb ? 8 : 4)
                : EdgeInsets.symmetric(horizontal: isWeb ? 8 : 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      item.images[0],
                      width: isWeb
                          ? 250
                          : isTablet
                              ? 200
                              : 150,
                      height: isWeb
                          ? 250
                          : isTablet
                              ? 200
                              : 150,
                    ),
                    Text(
                      item.headline,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: isWeb
                          ? AppTextStyles.dynamicStyle(
                              fontSize: 1.2.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )
                          : isTablet
                              ? AppTextStyles.dynamicStyle(
                                  fontSize: 4.sp, fontWeight: FontWeight.w700)
                              : AppTextStyles.dynamicStyle(
                                  fontSize: 13.sp, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 250,
                      child: Text(
                        item.subHeadline,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.dynamicStyle(
                          fontSize: isWeb
                              ? 0.8.sp
                              : isTablet
                                  ? 3.sp
                                  : 8.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade500,
                        ),
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
                                            fontSize: 3.sp,
                                            fontWeight: FontWeight.w700)
                                        : AppTextStyles.dynamicStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w700)
                                : isWeb
                                    ? AppTextStyles.productPriceSale
                                    : isTablet
                                        ? AppTextStyles.productPriceSaleTablet
                                        : AppTextStyles.productPriceSaleMobile),
                        const SizedBox(width: 8),
                        item.priceSale != 0.0
                            ? Text(
                                "${item.priceSale} \$",
                                style: isWeb
                                    ? AppTextStyles.productPriceNormal
                                    : isTablet
                                        ? AppTextStyles.dynamicStyle(
                                            fontSize: 3.sp,
                                            fontWeight: FontWeight.w700)
                                        : AppTextStyles.dynamicStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w700),
                              )
                            : const Center(),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  top: isWeb
                      ? 20
                      : isTablet
                          ? 8
                          : 5,
                  right: isWeb
                      ? 10
                      : isTablet
                          ? 8
                          : 5,
                  child: wIconButton(
                    iconPath: AppIcons.wishlist,
                    size: isWeb
                        ? 24.r
                        : isTablet
                            ? 16.r
                            : 18.r,
                    onTap: () {},
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildReviewsTab() {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: widget.product.reviews.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              tileColor: Colors.white,
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Row(
                children: [
                  Text(widget.product.reviews[index].username),
                  const SizedBox(width: 20),
                  ...List.generate(
                    widget.product.reviews[index].rate,
                    (i) =>
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                  ),
                ],
              ),
              subtitle: Text(widget.product.reviews[index].review),
            ),
          );
        },
      ),
    );
  }
}
