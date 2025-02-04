import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class W_CollectionList extends StatelessWidget {
  bool isWeb;
  bool isTablet;

  W_CollectionList({super.key, required this.isWeb, required this.isTablet});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isWeb
          ? 350
          : isTablet
              ? 340
              : 490,
      color: AppColors.primary,
      child: ListView(
        shrinkWrap: true,
        physics: isWeb ? const BouncingScrollPhysics() : const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: isWeb ? 25 : 14,
                top: isWeb
                    ? 12
                    : isTablet
                        ? 12
                        : 2,
                bottom: 12),
            child: Text(
              "Handpicked Collections",
              style: isWeb
                  ? AppTextStyles.dynamicStyle(
                      fontSize: 1.7.sp, fontWeight: FontWeight.w600, color: Colors.white)
                  : isTablet
                      ? AppTextStyles.dynamicStyle(
                          fontSize: 5.sp, fontWeight: FontWeight.w600, color: Colors.white)
                      : AppTextStyles.dynamicStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
          isWeb
              ? _itemListViewWeb(false)
              : isTablet
                  ? _itemListViewWeb(true)
                  : _itemListViewMobile()
        ],
      ),
    );
  }

  _itemListViewWeb(isTablet) => SizedBox(
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
                  ? EdgeInsets.only(left: isTablet ? 14 : 25, right: isTablet ? 6 : 8)
                  : EdgeInsets.symmetric(horizontal: isTablet ? 6 : 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(image: AssetImage(images[index]), fit: BoxFit.contain)),
            );
          },
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
}
