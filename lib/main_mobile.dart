import 'package:ecommerce_woocom/presentation/widgets/w_appbar.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_bannerSlider.dart';
import 'package:flutter/material.dart';

import 'core/constants/app_assets.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: wAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [wBannerSlider(AppAssets.banner_mobile, 12)],
        ),
      ),
    );
  }
}
