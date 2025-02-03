import 'package:ecommerce_woocom/presentation/widgets/w_web_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_icons.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_text_styles.dart';

w_MobileFooter() {
  List policyList = [
    "Return Policy",
    "Terms of Use",
    "Sitemap",
    "Security",
    "Privacy",
    "EPR Compliance",
  ];
  List aboutList = [
    "Contact Us",
    "About Us",
    "Careers",
    "Press",
  ];
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 14, bottom: 12),
        child: Text(
          "More About Woocom",
          style: AppTextStyles.dynamicStyle(
              fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppColors.primary),
        ),
      ),
      Container(
        width: double.infinity,
        color: AppColors.primary,
        padding: const EdgeInsets.only(left: 30, right: 40, top: 30, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Shop by Category",
              style: AppTextStyles.dynamicStyle(
                  fontSize: 14.sp, fontWeight: FontWeight.w700, color: Colors.white),
            ),
            categoryListItem("Skincare", false),
            categoryListItem("Personal Care", false),
            categoryListItem("Handbags", false),
            categoryListItem("Apparels", false),
            categoryListItem("Watches", false),
            categoryListItem("Eye Wear", false),
            categoryListItem("Jewellery", false),
            w_wrapList("Policy", policyList),
            w_wrapList("About Us", aboutList),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                        fontSize: 12.sp, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                AppStrings.footerStaticText,
                style: AppTextStyles.dynamicStyle(
                    fontSize: 12.sp, fontWeight: FontWeight.w600, color: AppColors.lightGray),
              ),
            )
          ],
        ),
      )
    ],
  );
}

w_wrapList(String title, List list) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        Text(
          title,
          style: AppTextStyles.dynamicStyle(
              fontSize: 14.sp, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          alignment: WrapAlignment.start,
          children: list.asMap().entries.map((entry) {
            int index = entry.key;
            String item = entry.value;
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(onTap: () {}, child: categoryListItem(item, false)),
                if (index != list.length - 1)
                  Container(
                    width: 2,
                    height: 18,
                    color: Colors.grey,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                  ),
              ],
            );
          }).toList(),
        )
      ],
    );
