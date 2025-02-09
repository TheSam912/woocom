import 'package:ecommerce_woocom/core/constants/app_colors.dart';
import 'package:ecommerce_woocom/core/constants/app_icons.dart';
import 'package:ecommerce_woocom/core/constants/app_text_styles.dart';
import 'package:ecommerce_woocom/presentation/pages/category/provider/sort_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_lists.dart';
import '../../../core/repository/product_respository.dart';
import '../../../core/repository/product_respository.dart';
import '../../widgets/w_product.dart';
import '../../widgets/w_product_filter_tile.dart';

class CategoryMobile extends StatelessWidget {
  CategoryMobile({super.key, required this.isTablet});

  bool isTablet;

  void _sortItems(SortOption selectedOption) {
    print('Sorting items by: ${_getSortLabel(selectedOption)}');
  }

  String _getSortLabel(SortOption option) {
    switch (option) {
      case SortOption.latest:
        return 'Latest Products';
      case SortOption.lowToHigh:
        return 'Price- Low to High';
      case SortOption.highToLow:
        return 'Price- High to Low';
      case SortOption.popular:
        return 'Popularity';
      case SortOption.customerRating:
        return 'Customer Ratings';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(preferredSize: Size(0, 0), child: Center()),
      body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              _customAppbarWidget(context),
              _floatingButtons(context),
              Divider(
                color: Colors.grey.shade300,
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: isTablet ? 25 : 14),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isTablet ? 3 : 2,
                    childAspectRatio: isTablet ? 0.72 : 0.68,
                    crossAxisSpacing: isTablet ? 20 : 14),
                itemCount: ProductRepository.productList.length,
                itemBuilder: (context, index) {
                  var item = ProductRepository.productList[index];
                  return W_ProductWidget(
                    item: item,
                    isTablet: isTablet,
                    isWeb: false,
                  );
                },
              ),
              const SizedBox(
                height: 20,
              )
            ],
          )),
    );
  }

  _floatingButtons(context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              flex: 1,
              child: GestureDetector(
                onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => _sortProductBottomSheet()),
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppIcons.sort,
                        width: 28,
                        height: 28,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "SORT",
                        style: isTablet
                            ? AppTextStyles.dynamicStyle(
                                fontSize: 3.sp, fontWeight: FontWeight.w700)
                            : AppTextStyles.dynamicStyle(
                                fontSize: 11.sp, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              )),
          Flexible(
              flex: 1,
              child: GestureDetector(
                onTap: () => showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.white,
                  builder: (context) => _filterProductBottomSheet(),
                ),
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppIcons.filter,
                        width: 28,
                        height: 28,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "FILTER",
                        style: isTablet
                            ? AppTextStyles.dynamicStyle(
                                fontSize: 3.sp, fontWeight: FontWeight.w700)
                            : AppTextStyles.dynamicStyle(
                                fontSize: 11.sp, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      );

  _filterProductBottomSheet() => Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
            child: ListView(
              children: [
                W_Product_Filter_Tile(
                    ref, "Size", AppLists.sizes, false, isTablet),
                W_Product_Filter_Tile(
                    ref, "Brands", AppLists.brands, false, isTablet),
                W_Product_Filter_Tile(
                    ref, "Colors", AppLists.colors, false, isTablet),
              ],
            ),
          );
        },
      );

  _sortProductBottomSheet() => Consumer(
        builder: (context, ref, child) {
          final selectedSort = ref.watch(selectedSortProvider);

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: SortOption.values.map((option) {
                return ListTile(
                  title: Text(
                    _getSortLabel(option),
                    style: AppTextStyles.dynamicStyle(
                        fontSize: isTablet ? 3.5.sp : 12.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  leading: Radio<SortOption>(
                    value: option,
                    activeColor: AppColors.primary,
                    groupValue: selectedSort,
                    onChanged: (value) {
                      ref
                          .read(selectedSortProvider.notifier)
                          .updateSort(value!);
                      Navigator.pop(context);
                      _sortItems(value);
                    },
                  ),
                  onTap: () {
                    ref.read(selectedSortProvider.notifier).updateSort(option);
                    Navigator.pop(context);
                    _sortItems(option);
                  },
                );
              }).toList(),
            ),
          );
        },
      );

  _customAppbarWidget(context) => Container(
        height: 50,
        width: double.infinity,
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.black,
                  size: isTablet ? 40 : 30,
                )),
            Text(
              "HandBags",
              style: AppTextStyles.dynamicStyle(fontWeight: FontWeight.bold),
            ),
            IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.white,
                  size: isTablet ? 40 : 30,
                )),
          ],
        ),
      );
}
