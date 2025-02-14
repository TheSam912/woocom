import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../pages/admin/admin_web.dart';

Widget W_PanelSideItem(WidgetRef ref, int index, String icon, String title) {
  var selectedIndex = ref.watch(selectedIndexProvider);
  return GestureDetector(
    onTap: () {
      ref.read(selectedIndexProvider.notifier).state = index;
      selectedIndex = index;
    },
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: selectedIndex == index ? Colors.white : AppColors.primary,
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 20,
            color: selectedIndex == index ? AppColors.primary : Colors.white,
          ),
          const SizedBox(width: 8),
          Text(title,
              style: AppTextStyles.dynamicStyle(
                color:
                    selectedIndex == index ? AppColors.primary : Colors.white,
                fontSize: 0.9.sp,
                fontWeight:
                    selectedIndex == index ? FontWeight.w700 : FontWeight.w500,
              ))
        ],
      ),
    ),
  );
}
