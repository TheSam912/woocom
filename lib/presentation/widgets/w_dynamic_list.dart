import 'package:ecommerce_woocom/data/models/product_model.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_iconButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_icons.dart';
import '../../core/constants/app_text_styles.dart';

class w_DynamicList extends StatefulWidget {
  String listTitle;
  List<ProductModel> productList;
  bool isWeb;
  bool isTablet;

  w_DynamicList(
      {super.key,
      required this.listTitle,
      required this.productList,
      required this.isWeb,
      required this.isTablet});

  @override
  State<w_DynamicList> createState() => _w_DynamicListState();
}

class _w_DynamicListState extends State<w_DynamicList> {
  @override
  Widget build(BuildContext context) {
    bool isWeb = widget.isWeb;
    bool isTablet = widget.isTablet;
    return Padding(
      padding: isWeb
          ? const EdgeInsets.only(left: 25, top: 12, bottom: 12)
          : EdgeInsets.only(left: 14, bottom: isTablet ? 0 : 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.listTitle,
                style: isWeb
                    ? AppTextStyles.webListHeading
                    : isTablet
                        ? AppTextStyles.dynamicStyle(
                            fontSize: 5.sp, fontWeight: FontWeight.bold, color: AppColors.primary)
                        : AppTextStyles.dynamicStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppColors.primary),
              ),
              TextButton.icon(
                onPressed: () {
                  context.pushNamed("category");
                },
                iconAlignment: IconAlignment.end,
                icon: const Icon(
                  Icons.keyboard_arrow_right,
                  color: AppColors.primary,
                ),
                label: Text(
                  "View All",
                  style: isWeb
                      ? AppTextStyles.webListViewAll
                      : isTablet
                          ? AppTextStyles.dynamicStyle(
                              fontSize: 3.sp, fontWeight: FontWeight.bold, color: AppColors.primary)
                          : AppTextStyles.dynamicStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(
                top: isWeb
                    ? 12
                    : isTablet
                        ? 4
                        : 0),
            child: SizedBox(
              height: isWeb
                  ? 400
                  : isTablet
                      ? 340
                      : 220,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget.productList.length,
                itemBuilder: (context, index) {
                  var item = widget.productList[index];
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
                                        fontSize: 1.5.sp,
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
                                width: isWeb ? 250 : 150,
                                child: Text(
                                  item.subHeadline,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.dynamicStyle(
                                    fontSize: isWeb
                                        ? 1.sp
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
                                                      fontSize: 3.sp, fontWeight: FontWeight.w700)
                                                  : AppTextStyles.dynamicStyle(
                                                      fontSize: 10.sp, fontWeight: FontWeight.w700)
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
                                                      fontSize: 3.sp, fontWeight: FontWeight.w700)
                                                  : AppTextStyles.dynamicStyle(
                                                      fontSize: 10.sp, fontWeight: FontWeight.w700),
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
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
