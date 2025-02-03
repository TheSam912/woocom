import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_lists.dart';
import '../../core/constants/app_text_styles.dart';

w_BrandsList() => Padding(
  padding: const EdgeInsets.symmetric(vertical: 20),
  child: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 12,bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Shop By Brands",
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
          ),
          Container(
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
          )
        ],
      ),
);
