import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_icons.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_text_styles.dart';

w_WebFooter() => Container(
      color: AppColors.primary,
      padding: const EdgeInsets.only(left: 30, right: 40, top: 30, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_footerLeftSize(), _footerRightSide()],
      ),
    );

_footerLeftSize() => Flexible(
    flex: 5,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Shop by Category",
              style: AppTextStyles.dynamicStyle(
                  fontSize: 1.1.sp, fontWeight: FontWeight.w700, color: Colors.white),
            ),
            categoryListItem("Skincare"),
            categoryListItem("Personal Care"),
            categoryListItem("Handbags"),
            categoryListItem("Apparels"),
            categoryListItem("Watches"),
            categoryListItem("Eye Wear"),
            categoryListItem("Jewellery"),
          ],
        ),
        const SizedBox(
          width: 70,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About",
              style: AppTextStyles.dynamicStyle(
                  fontSize: 1.1.sp, fontWeight: FontWeight.w700, color: Colors.white),
            ),
            categoryListItem("Contact Us"),
            categoryListItem("About Us"),
            categoryListItem("Careers"),
            categoryListItem("Press"),
          ],
        ),
        const SizedBox(
          width: 70,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Policy",
              style: AppTextStyles.dynamicStyle(
                  fontSize: 1.1.sp, fontWeight: FontWeight.w700, color: Colors.white),
            ),
            categoryListItem("Return Policy"),
            categoryListItem("Terms of Use"),
            categoryListItem("Sitemap"),
            categoryListItem("Security"),
            categoryListItem("Privacy"),
            categoryListItem("EPR Compliance"),
          ],
        )
      ],
    ));

categoryListItem(title) => Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
        title,
        style: AppTextStyles.dynamicStyle(
            fontSize: 1.sp, fontWeight: FontWeight.w600, color: AppColors.lightGray),
      ),
    );

_footerRightSide() => Flexible(
    flex: 5,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                AppIcons.facebook,
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                AppIcons.instagram,
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                AppIcons.twitter,
                width: 40,
                height: 40,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            GestureDetector(
              onTap: () {},
              child: Image.asset(
                AppIcons.youtube,
                width: 40,
                height: 40,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              AppIcons.location,
              width: 20,
              height: 20,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              "United State",
              style: AppTextStyles.dynamicStyle(
                  fontSize: 1.2.sp, fontWeight: FontWeight.w700, color: Colors.white),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          AppStrings.footerStaticText,
          style: AppTextStyles.dynamicStyle(
              fontSize: 1.sp, fontWeight: FontWeight.w600, color: AppColors.lightGray),
        )
      ],
    ));
