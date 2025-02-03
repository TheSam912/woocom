import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_lists.dart';
import '../../core/constants/app_text_styles.dart';

w_CategoryList()=>Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Padding(
      padding: const EdgeInsets.only(left: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Top Categories",
            style: AppTextStyles.dynamicStyle(
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
              style: AppTextStyles.dynamicStyle(
                  fontSize: 10.sp, fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
          ),
        ],
      ),
    ),
    SizedBox(
      height: 95,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: AppLists.categoriesListMobile.length,
        itemBuilder: (context, index) => GestureDetector(
            onTap: () {},
            child: Container(
              width: 70,
              margin: index == 0
                  ? const EdgeInsets.only(left: 14, right: 5)
                  : const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppLists.categoriesListMobile[index].image),
                  Text(
                    AppLists.categoriesListMobile[index].title,
                    style: AppTextStyles.dynamicStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary),
                  )
                ],
              ),
            )),
      ),
    ),
  ],
);