import 'package:ecommerce_woocom/core/constants/app_assets.dart';
import 'package:ecommerce_woocom/core/constants/app_colors.dart';
import 'package:ecommerce_woocom/core/constants/app_lists.dart';
import 'package:ecommerce_woocom/presentation/pages/category/provider/select_size_provider.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_bannerSlider.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../widgets/w_appbar.dart';
import '../../widgets/w_product_filter_tile.dart';
import '../../widgets/w_web_footer.dart';

class CategoryWeb extends ConsumerStatefulWidget {
  CategoryWeb({super.key});

  @override
  ConsumerState<CategoryWeb> createState() => _CategoryWebState();
}

class _CategoryWebState extends ConsumerState<CategoryWeb> {
  @override
  Widget build(BuildContext context) {
    final selectedFilters = ref.watch(selectedFiltersProvider);
    final selectedSizes = selectedFilters["size"] ?? {};
    final selectedBrands = selectedFilters["brand"] ?? {};
    final selectedColors = selectedFilters["color"] ?? {};
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: wAppBarWeb(context, false),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            w_BannerSliderStatic(AppAssets.banner_blac_web, 25.0),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Column(
                          children: [
                            W_Product_Filter_Tile(
                                ref, "Size", AppLists.sizes, true, false),
                            W_Product_Filter_Tile(
                                ref, "Brands", AppLists.brands, true, false),
                            W_Product_Filter_Tile(
                                ref, "Colors", AppLists.colors, true, false),
                          ],
                        ),
                      )),
                  Flexible(
                      flex: 8,
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                childAspectRatio: 0.65,
                                crossAxisSpacing: 25),
                        itemCount: AppLists.productList.length,
                        itemBuilder: (context, index) {
                          var item = AppLists.productList[index];
                          return W_ProductWidget(
                              item: item, isTablet: false, isWeb: true);
                        },
                      ))
                ],
              ),
            ),
            w_WebFooter()
          ],
        ),
      ),
    );
  }
}
