import 'package:ecommerce_woocom/core/constants/app_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_lists.dart';
import '../../core/constants/app_text_styles.dart';

w_BrandsList(isWeb) => Padding(
      padding: EdgeInsets.symmetric(vertical: isWeb ? 20 : 0),
      child: ListView(
        shrinkWrap: true,
        physics: isWeb ? const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.only(left: isWeb ? 25.0 : 14.0, top: 12, bottom: isWeb ? 12 : 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Shop By Brands",
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
          ),
          isWeb ? _itemListWeb() : _itemListMobile()
        ],
      ),
    );

_itemListMobile() => Container(
      height: 265,
      margin: const EdgeInsets.symmetric(horizontal: 9),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        shrinkWrap: true,
        itemCount: AppLists.brandList.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              height: 100,
              width: 100,
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                AppLists.brandList[index].logo,
              ),
            ),
          );
        },
      ),
    );

_itemListWeb() => Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(top: 12),
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: AppLists.brandList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                height: 100,
                width: 100,
                padding: const EdgeInsets.all(20),
                margin: index == 0
                    ? const EdgeInsets.only(left: 25, right: 10)
                    : const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  AppLists.brandList[index].logo,
                ),
              ),
            );
          },
        ),
      ),
    );
