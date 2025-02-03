import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

w_CollectionList(isWeb) => Container(
      height: isWeb ? 350 : 450,
      color: AppColors.primary,
      child: ListView(
        shrinkWrap: true,
        physics: isWeb ? const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.only(left: isWeb ? 25 : 14, top: 12, bottom: 12),
            child: Text(
              "Handpicked Collections",
              style: isWeb
                  ? AppTextStyles.dynamicStyle(
                      fontSize: 1.5.sp, fontWeight: FontWeight.w600, color: Colors.white)
                  : AppTextStyles.dynamicStyle(
                      fontSize: 14.sp, fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
          isWeb ? _itemListViewWeb() : _itemListViewMobile()
        ],
      ),
    );

_itemListViewMobile() => Container(
      height: 480,
      margin: const EdgeInsets.symmetric(horizontal: 9),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 4,
        itemBuilder: (context, index) {
          List images = [
            AppAssets.collectionImage1,
            AppAssets.collectionImage2,
            AppAssets.collectionImage3,
            AppAssets.collectionImage4,
          ];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: AssetImage(images[index]), fit: BoxFit.contain)),
          );
        },
      ),
    );

_itemListViewWeb() => SizedBox(
      height: 250,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          List images = [
            AppAssets.collectionImage1,
            AppAssets.collectionImage2,
            AppAssets.collectionImage3,
            AppAssets.collectionImage4,
            AppAssets.collectionImage5,
          ];
          return Container(
            width: 250,
            height: 250,
            margin: index == 0
                ? const EdgeInsets.only(left: 25, right: 8)
                : const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: AssetImage(images[index]), fit: BoxFit.contain)),
          );
        },
      ),
    );
