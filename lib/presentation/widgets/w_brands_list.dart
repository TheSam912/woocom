import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_lists.dart';
import '../../core/constants/app_text_styles.dart';

class W_BrandList extends StatelessWidget {
  const W_BrandList({super.key, required this.isWeb, required this.isTablet});

  final bool isWeb;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: isWeb ? 20 : 0),
      child: ListView(
        shrinkWrap: true,
        physics: isWeb
            ? const BouncingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: isWeb ? 25.0 : 14.0,
                top: isWeb
                    ? 12
                    : isTablet
                        ? 12
                        : 0,
                bottom: isWeb ? 12 : 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Shop By Brands",
                  style: isWeb
                      ? AppTextStyles.webListHeading
                      : isTablet
                          ? AppTextStyles.dynamicStyle(
                              fontSize: 5.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary)
                          : AppTextStyles.dynamicStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary),
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
                        : isTablet
                            ? AppTextStyles.dynamicStyle(
                                fontSize: 3.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary)
                            : AppTextStyles.dynamicStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary),
                  ),
                ),
              ],
            ),
          ),
          isWeb
              ? _itemListWeb(false)
              : isTablet
                  ? _itemListWeb(true)
                  : _itemListMobile()
        ],
      ),
    );
  }

  _itemListWeb(isTablet) => Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: isTablet ? 8 : 12),
        child: SizedBox(
          height: isTablet ? 130 : 100,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: AppLists.brandList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  height: isTablet ? 130 : 100,
                  width: isTablet ? 130 : 100,
                  padding: EdgeInsets.all(isTablet ? 30 : 20),
                  margin: index == 0
                      ? EdgeInsets.only(left: isTablet ? 14 : 25, right: 10)
                      : EdgeInsets.symmetric(horizontal: isTablet ? 8 : 10),
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

  _itemListMobile() => Container(
        height: 265,
        margin: const EdgeInsets.symmetric(horizontal: 9),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          shrinkWrap: true,
          itemCount: AppLists.brandList.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                height: 100,
                width: 100,
                padding: const EdgeInsets.all(25),
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
}
