import 'package:flutter/material.dart';

import '../../core/constants/app_strings.dart';
import '../../core/constants/app_text_styles.dart';

wNewsLetter() => Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      color: Colors.grey.shade100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.webRegisterForNewsLetter,
            style: AppTextStyles.dynamicStyle(fontSize: 4, fontWeight: FontWeight.w600),
          ),
          Text(
            "here",
            style: AppTextStyles.dynamicStyle(
              fontSize: 4,
              color: Colors.blueAccent,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
