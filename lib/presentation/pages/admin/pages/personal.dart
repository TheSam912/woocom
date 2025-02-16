import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../authentication/provider/auth_provider.dart';

class PersonalSettingsScreen extends ConsumerWidget {
  const PersonalSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Personal Settings",
                  style: AppTextStyles.dynamicStyle(
                    fontSize: 1.5.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    ref.read(authRepositoryProvider).signOut();
                    ref.invalidate(authStateProvider);
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
