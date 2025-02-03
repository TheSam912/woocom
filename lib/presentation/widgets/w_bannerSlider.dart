import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';

w_BannerSlider(image, marginHorizontal) => Container(
      margin: EdgeInsets.symmetric(horizontal: marginHorizontal, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.infinity,
      child: Image.asset(
        AppAssets.banner_web,
        fit: BoxFit.cover,
      ),
    );
