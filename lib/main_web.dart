import 'package:ecommerce_woocom/core/constants/app_assets.dart';
import 'package:ecommerce_woocom/core/constants/app_icons.dart';
import 'package:ecommerce_woocom/core/constants/app_lists.dart';
import 'package:ecommerce_woocom/core/constants/app_strings.dart';
import 'package:ecommerce_woocom/core/constants/app_text_styles.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_brands_list.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_dynamic_list.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_appbar.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_bannerSlider.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_collection_list.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_grid_tiles.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_iconButton.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_newsLetter.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_web_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constants/app_colors.dart';

class WebHomePage extends StatelessWidget {
  const WebHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: wAppBarWeb(),
      body: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          wNewsLetter(),
          wBannerSlider(AppAssets.banner_web, 25),
          W_DynamicList("New Arrivals", AppLists.productList),
          w_CollectionList(),
          w_BrandsList(),
          w_GridTiles(),
          w_WebFooter()
        ],
      ),
    );
  }
}
