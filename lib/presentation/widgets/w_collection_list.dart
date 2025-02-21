import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class W_CollectionList extends StatelessWidget {
  const W_CollectionList({super.key, required this.isWeb, required this.isTablet});

  final bool isWeb;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isWeb
          ? 350
          : isTablet
              ? 340
              : 460,
      color: AppColors.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                EdgeInsets.only(left: isWeb ? 25 : 14, top: 12, bottom: 12),
            child: Text(
              "Handpicked Collections",
              style: isWeb
                  ? AppTextStyles.dynamicStyle(
                      fontSize: 1.7.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)
                  : isTablet
                      ? AppTextStyles.dynamicStyle(
                          fontSize: 5.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)
                      : AppTextStyles.dynamicStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
            ),
          ),
          isWeb
              ? _itemListViewWeb(false)
              : isTablet
                  ? _itemListViewWeb(true)
                  : _itemListViewMobileSimpleView()
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
                  ? EdgeInsets.only(
                      left: isTablet ? 14 : 25, right: isTablet ? 6 : 8)
                  : EdgeInsets.symmetric(horizontal: isTablet ? 6 : 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(images[index]), fit: BoxFit.contain)),
            );
          },
        ),
      );

  _itemListViewMobileSimpleView() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                    flex: 5, child: Image.asset(AppAssets.collectionImage1)),
                const SizedBox(
                  width: 12,
                ),
                Flexible(
                    flex: 5, child: Image.asset(AppAssets.collectionImage2))
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Flexible(
                    flex: 5, child: Image.asset(AppAssets.collectionImage3)),
                const SizedBox(
                  width: 12,
                ),
                Flexible(
                    flex: 5, child: Image.asset(AppAssets.collectionImage4))
              ],
            )
          ],
        ),
      );
}
