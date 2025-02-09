import 'package:ecommerce_woocom/presentation/widgets/w_appbar.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_bannerSlider.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_brands_list.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_category_list.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_collection_list.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_grid_tiles.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_mobile_footer.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_assets.dart';
import '../../core/repository/product_respository.dart';
import '../widgets/w_dynamic_list.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            W_Appbar(isTablet: false),
            w_BannerSlider_Mobile(AppAssets.banner_mobile, false),
            w_CategoryList(),
            w_DynamicList(
                listTitle: "New Arrivals",
                productList:  ProductRepository
                    .productList,
                isWeb: false,
                isTablet: false),
            W_CollectionList(isWeb: false, isTablet: false),
            W_BrandList(isWeb: false, isTablet: false),
            w_gridTileMobile(),
            W_FooterMobileTablet(isTablet: false)
          ],
        ),
      ),
    );
  }
}
