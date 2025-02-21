import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class W_TabBarWidget extends StatelessWidget {
  const W_TabBarWidget(
      {super.key,
      required this.controller,
      required this.isWeb,
      required this.isTablet});

  final  TabController controller;
  final  bool isWeb;
  final  bool isTablet;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      dividerColor: Colors.grey.shade200,
      indicatorWeight: 3.5,
      indicatorColor: Colors.blueGrey,
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
