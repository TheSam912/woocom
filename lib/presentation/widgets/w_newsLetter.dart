import 'package:ecommerce_woocom/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_strings.dart';
import '../../core/constants/app_text_styles.dart';

wNewsLetter() => Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      color: AppColors.appbarGray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.webRegisterForNewsLetter,
            style: AppTextStyles.dynamicStyle(fontSize: 4, fontWeight: FontWeight.w600),
          ),
          Text(
            "here",
            style: AppTextStyles.hereTextNewsLetter,
          ),
        ],
      ),
    );
