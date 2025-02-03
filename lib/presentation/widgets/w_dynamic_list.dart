import 'package:ecommerce_woocom/data/models/product_model.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_iconButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_icons.dart';
import '../../core/constants/app_text_styles.dart';

class w_DynamicList extends StatefulWidget {
  String listTitle;
  List<ProductModel> productList;
  bool isWeb;

  w_DynamicList(this.listTitle, this.productList, this.isWeb, {super.key});

  @override
  State<w_DynamicList> createState() => _w_DynamicListState();
}

class _w_DynamicListState extends State<w_DynamicList> {
  @override
  Widget build(BuildContext context) {
    bool isWeb = widget.isWeb;
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: isWeb
            ? const EdgeInsets.only(left: 25, top: 12, bottom: 12)
            : const EdgeInsets.only(left: 14),
        child: ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.listTitle,
                  style: isWeb
                      ? AppTextStyles.webListHeading
                      : AppTextStyles.dynamicStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppColors.primary),
                ),
                TextButton.icon(
                  onPressed: () {},
                  iconAlignment: IconAlignment.end,
                  icon: const Icon(
                    Icons.keyboard_arrow_right,
                    color: AppColors.primary,
                  ),
                  label: Text(
                    "View All",
                    style: isWeb
                        ? AppTextStyles.webListViewAll
                        : AppTextStyles.dynamicStyle(
                            fontSize: 10.sp, fontWeight: FontWeight.bold, color: AppColors.primary),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: isWeb ? 12 : 0),
              child: SizedBox(
                height: isWeb ? 400 : 220,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.productList.length,
                  itemBuilder: (context, index) {
                    var item = widget.productList[index];
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
                            mainAxisSize: MainAxisSize.min, // Important for dynamic height
                            children: [
                              Image.asset(
                                item.images[0],
                                width: isWeb ? 250 : 150,
                                height: isWeb ? 250 : 150,
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
                                    : AppTextStyles.dynamicStyle(
                                        fontSize: 13.sp, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                item.subHeadline,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.dynamicStyle(
                                  fontSize: isWeb ? 1.sp : 8.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Text("${item.price} \$",
                                      style: item.priceSale == 0.0
                                          ? isWeb
                                              ? AppTextStyles.productPriceNormal
                                              : AppTextStyles.dynamicStyle(
                                                  fontSize: 10.sp, fontWeight: FontWeight.w700)
                                          : isWeb
                                              ? AppTextStyles.productPriceSale
                                              : AppTextStyles.productPriceSaleMobile),
                                  const SizedBox(width: 8),
                                  item.priceSale != 0.0
                                      ? Text(
                                          "${item.priceSale} \$",
                                          style: isWeb
                                              ? AppTextStyles.productPriceNormal
                                              : AppTextStyles.dynamicStyle(
                                                  fontSize: 10.sp, fontWeight: FontWeight.w700),
                                        )
                                      : const Center(),
                                ],
                              ),
                            ],
                          ),
                          Positioned(
                            top: isWeb ? 20 : 5,
                            right: isWeb ? 10 : 5,
                            child: wIconButton(
                              iconPath: AppIcons.wishlist,
                              size: isWeb ? 24.r : 18.r,
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
