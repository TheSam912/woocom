import 'package:ecommerce_woocom/presentation/widgets/w_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/repository/product_respository.dart';
import '../../widgets/w_bannerSlider.dart';
import '../../widgets/w_brands_list.dart';
import '../../widgets/w_collection_list.dart';
import '../../widgets/w_drawer.dart';
import '../../widgets/w_dynamic_list.dart';
import '../../widgets/w_grid_tiles.dart';
import '../../widgets/w_mobile_footer.dart';

class TabletHomePage extends ConsumerWidget {
  TabletHomePage({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: W_DrawerWidgetTablet(context,ref, true, _scaffoldKey),
      body: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          W_Appbar(
            isTablet: true,
            scaffoldKey: _scaffoldKey,
          ),
          w_BannerSlider_Mobile(AppAssets.banner_web, true),
          w_DynamicList(
              listTitle: "New Arrivals",
              productList: ProductRepository.productList,
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
