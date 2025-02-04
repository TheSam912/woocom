import 'package:ecommerce_woocom/presentation/widgets/w_appbar.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_lists.dart';
import '../widgets/w_bannerSlider.dart';
import '../widgets/w_brands_list.dart';
import '../widgets/w_collection_list.dart';
import '../widgets/w_dynamic_list.dart';
import '../widgets/w_grid_tiles.dart';
import '../widgets/w_mobile_footer.dart';

class TabletHomePage extends StatelessWidget {
  const TabletHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          W_Appbar(isTablet: true),
          w_BannerSlider(AppAssets.banner_web, 14.0),
          w_DynamicList(
              listTitle: "New Arrivals",
              productList: AppLists.productList,
              isWeb: false,
              isTablet: true),
          W_CollectionList(isWeb: false, isTablet: true),
          W_BrandList(isWeb: false, isTablet: true),
          w_gridTileTablet(),
          W_FooterMobileTablet(isTablet: true)
        ],
      ),
    );
  }
}
