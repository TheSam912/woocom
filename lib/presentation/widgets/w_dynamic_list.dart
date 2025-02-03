import 'package:ecommerce_woocom/data/models/product_model.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_iconButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_icons.dart';
import '../../core/constants/app_lists.dart';
import '../../core/constants/app_text_styles.dart';

class W_DynamicList extends StatefulWidget {
  String listTitle;
  List<ProductModel> productList;

  W_DynamicList(this.listTitle, this.productList, {super.key});

  @override
  State<W_DynamicList> createState() => _W_DynamicListState();
}

class _W_DynamicListState extends State<W_DynamicList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(left: 25, top: 12, bottom: 12),
        child: ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.listTitle,
                  style: AppTextStyles.webListHeading,
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
                    style: AppTextStyles.webListViewAll,
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 12),
              child: SizedBox(
                height: 350,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.productList.length,
                  itemBuilder: (context, index) {
                    var item = widget.productList[index];
                    return Container(
                      margin: index == 0
                          ? const EdgeInsets.only(right: 8)
                          : const EdgeInsets.symmetric(horizontal: 8),
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
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Image.asset(
                                  item.images[0],
                                  width: 250,
                                  height: 250,
                                ),
                              ),
                              Text(
                                item.headline,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.dynamicStyle(
                                  fontSize: 1.9.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                item.subHeadline,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.dynamicStyle(
                                  fontSize: 1.2.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Text("${item.price} \$",
                                      style: item.priceSale == 0.0
                                          ? AppTextStyles.productPriceNormal
                                          : AppTextStyles.productPriceSale),
                                  const SizedBox(width: 8),
                                  item.priceSale != 0.0
                                      ? Text(
                                          "${item.priceSale} \$",
                                          style: AppTextStyles.productPriceNormal,
                                        )
                                      : const Center(),
                                ],
                              ),
                            ],
                          ),
                          Positioned(
                            top: 20,
                            right: 10,
                            child: wIconButton(
                              iconPath: AppIcons.wishlist,
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
