import 'package:ecommerce_woocom/core/constants/app_icons.dart';
import 'package:ecommerce_woocom/core/constants/app_lists.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_appbar.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_bannerSlider.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_brands_list.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_category_list.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_collection_list.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_grid_tiles.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_mobile_footer.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_web_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../widgets/w_dynamic_list.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: wAppbarMobile(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            w_BannerSlider(AppAssets.banner_mobile, 14.0),
            w_CategoryList(),
            w_DynamicList("New Arrivals", AppLists.productList, false),
            w_CollectionList(false),
            w_BrandsList(false),
            w_gridTileMobile(),
            w_MobileFooter()
          ],
        ),
      ),
    );
  }
}
