import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../pages/category/provider/select_size_provider.dart';

Widget W_Product_Filter_Tile(
    WidgetRef ref, String category, List<String> list, isWeb, isTablet) {
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
        fontSize: isWeb
            ? 1.3.sp
            : isTablet
                ? 4.5.sp
                : 14.sp,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    ),
    children: List.generate(
      list.length,
      (index) =>
          buildCheckboxListTile(ref, category, list[index], isWeb, isTablet),
    ),
  );
}

Widget buildCheckboxListTile(
    WidgetRef ref, String category, String value, isWeb, isTablet) {
  final selectedFilters = ref.watch(selectedFiltersProvider);
  final isSelected = selectedFilters[category]?.contains(value) ?? false;

  return CheckboxListTile(
    title: Text(
      value,
      style: AppTextStyles.dynamicStyle(
        fontSize: isWeb
            ? 1.sp
            : isTablet
                ? 3.5.sp
                : 12.sp,
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
