import 'package:ecommerce_woocom/core/constants/app_assets.dart';
import 'package:ecommerce_woocom/core/constants/app_colors.dart';
import 'package:ecommerce_woocom/core/constants/app_lists.dart';
import 'package:ecommerce_woocom/presentation/pages/category/provider/select_size_provider.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_bannerSlider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_icons.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../widgets/w_appbar.dart';
import '../../widgets/w_iconButton.dart';
import '../../widgets/w_web_footer.dart';

class CategoryWeb extends ConsumerStatefulWidget {
  CategoryWeb({super.key});

  @override
  ConsumerState<CategoryWeb> createState() => _CategoryWebState();
}

class _CategoryWebState extends ConsumerState<CategoryWeb> {
  @override
  Widget build(BuildContext context) {
    bool isWeb = true;
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
                            _filterExpansionTile(ref, "Size", AppLists.sizes),
                            _filterExpansionTile(
                                ref, "Brands", AppLists.brands),
                            _filterExpansionTile(
                                ref, "Colors", AppLists.colors),
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
                          return GestureDetector(
                            onTap: () {
                              context.pushNamed(
                                "product_detail",
                                extra: {
                                  "product": item,
                                },
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(item.images[0],
                                      width: 250, height: 250),
                                  Text(item.headline,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyles.dynamicStyle(
                                        fontSize: 1.5.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      )),
                                  SizedBox(
                                    width: isWeb ? 250 : 150,
                                    child: Text(
                                      item.subHeadline,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyles.dynamicStyle(
                                        fontSize: 1.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        "${item.price} \$",
                                        style: item.priceSale == 0.0
                                            ? AppTextStyles.productPriceNormal
                                            : AppTextStyles.productPriceSale,
                                      ),
                                      const SizedBox(width: 8),
                                      item.priceSale != 0.0
                                          ? Text("${item.priceSale} \$",
                                              style: AppTextStyles
                                                  .productPriceNormal)
                                          : const Center(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
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

  Widget _filterExpansionTile(
      WidgetRef ref, String category, List<String> list) {
    final selectedFilters = ref.watch(selectedFiltersProvider);
    final selectedValues = selectedFilters[category] ?? {};

    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.zero,
      initiallyExpanded: true,
      backgroundColor: Colors.white,
      collapsedBackgroundColor: Colors.white,
      shape: const Border(),
      title: Text(
        category,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.dynamicStyle(
          fontSize: 1.3.sp,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      children: List.generate(
        list.length,
        (index) => buildCheckboxListTile(ref, category, list[index]),
      ),
    );
  }
}

Widget buildCheckboxListTile(WidgetRef ref, String category, String value) {
  final selectedFilters = ref.watch(selectedFiltersProvider);
  final isSelected = selectedFilters[category]?.contains(value) ?? false;

  return CheckboxListTile(
    title: Text(
      value,
      style: AppTextStyles.dynamicStyle(
        fontSize: 1.3.sp,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    ),
    value: isSelected,
    checkColor: Colors.white,
    activeColor: AppColors.primary,
    onChanged: (bool? checked) {
      ref.read(selectedFiltersProvider.notifier).toggleFilter(category, value);
    },
    controlAffinity: ListTileControlAffinity.leading,
  );
}
