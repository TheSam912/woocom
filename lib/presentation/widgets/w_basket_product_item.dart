import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_icons.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/models/product_model.dart';

Widget W_ProductItemWidget(ProductModel index, type, isTablet) => Container(
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
                          type == "bag"
                              ? Padding(
                                  padding: const EdgeInsets.only(right: 4.0),
                                  child: GestureDetector(
                                      onTap: () {},
                                      child: const Icon(Icons.close)),
                                )
                              : const Center()
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
                                  border:
                                      Border.all(color: Colors.black, width: 1),
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
          type == "bag"
              ? Divider(
                  indent: 12,
                  endIndent: 12,
                  color: Colors.grey.shade200,
                )
              : const Center(),
          type == "bag"
              ? Row(
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
                      margin:
                          EdgeInsets.symmetric(horizontal: isTablet ? 80 : 30),
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
                )
              : const Center(),
        ],
      ),
    );
