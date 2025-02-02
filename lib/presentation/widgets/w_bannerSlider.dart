import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';

wBannerSlider(image,marginHorizontal) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.infinity,
      child: Image.asset(
        AppAssets.banner_web,
        fit: BoxFit.cover,
      ),
    );
