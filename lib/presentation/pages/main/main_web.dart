import 'package:ecommerce_woocom/core/constants/app_assets.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_brands_list.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_dynamic_list.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_appbar.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_bannerSlider.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_collection_list.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_grid_tiles.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_newsLetter.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_web_footer.dart';
import 'package:flutter/material.dart';

import '../../../core/repository/product_respository.dart';

class WebHomePage extends StatelessWidget {
  const WebHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: wAppBarWeb(context, true),
      body: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          wNewsLetter(),
          w_BannerSlider(AppAssets.banner_web, 25.0),
          w_DynamicList(
              listTitle: "New Arrivals",
              productList: ProductRepository.productList,
              isWeb: true,
              isTablet: false),
          W_CollectionList(isWeb: true, isTablet: false),
          W_BrandList(isWeb: true, isTablet: false),
          w_GridTiles(),
          w_WebFooter()
        ],
      ),
    );
  }
}
