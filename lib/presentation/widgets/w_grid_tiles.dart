import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

w_GridTiles() => ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
          child: Image.asset(
            AppAssets.grid_web_large,
            fit: BoxFit.contain,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 12, bottom: 20),
          child: Row(
            children: [
              Flexible(
                flex: 5,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppAssets.grid_web_small1), fit: BoxFit.fill)),
                  height: 250,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                flex: 5,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppAssets.grid_web_small2), fit: BoxFit.fill)),
                  height: 250,
                ),
              ),
            ],
          ),
        )
      ],
    );

w_gridTileMobile() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14, bottom: 12, top: 12),
          child: Text(
            "Makeup & Skincare",
            style: AppTextStyles.dynamicStyle(
                fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppColors.primary),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: SizedBox(
            height: 160,
            child: Image.asset(
              AppAssets.grid_mobile_large,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14, right: 14, top: 0, bottom: 20),
          child: Row(
            children: [
              Flexible(
                flex: 5,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppAssets.grid_mobile_small1), fit: BoxFit.fill)),
                  height: 120,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                flex: 5,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppAssets.grid_mobile_small2), fit: BoxFit.fill)),
                  height: 120,
                ),
              ),
            ],
          ),
        )
      ],
    );

w_gridTileTablet() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14, bottom: 12, top: 12),
          child: Text(
            "Makeup & Skincare",
            style: AppTextStyles.dynamicStyle(
                fontSize: 5.sp, fontWeight: FontWeight.bold, color: AppColors.primary),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Container(
            color: Colors.amber,
            width: double.infinity,
            height: 260,
            child: Image.asset(
              AppAssets.grid_web_large,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14, right: 14, top: 0, bottom: 20),
          child: Row(
            children: [
              Flexible(
                flex: 5,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppAssets.grid_web_small1), fit: BoxFit.fill)),
                  height: 220,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Flexible(
                flex: 5,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(AppAssets.grid_web_small2), fit: BoxFit.fill)),
                  height: 220,
                ),
              ),
            ],
          ),
        )
      ],
    );
