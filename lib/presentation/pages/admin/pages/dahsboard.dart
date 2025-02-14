import 'package:ecommerce_woocom/core/constants/app_assets.dart';
import 'package:ecommerce_woocom/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_text_styles.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              "Dashboard",
              style: AppTextStyles.dynamicStyle(
                fontSize: 1.5.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
          Image.asset(AppAssets.boxes),
          Row(
            children: [
              Flexible(
                  flex: 7,
                  child:
                      Image.asset(AppAssets.ordersChart, fit: BoxFit.contain)),
              const SizedBox(
                width: 12,
              ),
              Flexible(
                  flex: 3,
                  child: Image.asset(
                    AppAssets.last7days,
                    fit: BoxFit.contain,
                    height: 493,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
