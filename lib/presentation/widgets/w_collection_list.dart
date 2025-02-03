import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

w_CollectionList() => Container(
      height: 350,
      color: AppColors.primary,
      child: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 12, bottom: 12),
            child: Text(
              "Handpicked Collections",
              style: AppTextStyles.dynamicStyle(
                  fontSize: 1.5.sp, fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
          SizedBox(
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
                      image:
                          DecorationImage(image: AssetImage(images[index]), fit: BoxFit.contain)),
                );
              },
            ),
          )
        ],
      ),
    );
