import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class W_TabBarWidget extends StatelessWidget {
  W_TabBarWidget(
      {super.key,
      required this.controller,
      required this.isWeb,
      required this.isTablet});

  TabController controller;
  bool isWeb;
  bool isTablet;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      dividerColor: Colors.grey.shade300,
      indicatorWeight: 4,
      indicatorColor: AppColors.primary,
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: AppColors.primary,
      unselectedLabelColor: AppColors.textLight,
      labelStyle: AppTextStyles.dynamicStyle(
          fontSize: isWeb
              ? 1.sp
              : isTablet
                  ? 4.sp
                  : 12.sp,
          fontWeight: FontWeight.w600),
      tabs: const [
        Tab(text: 'User'),
        Tab(text: 'Admin'),
      ],
    );
  }
}
