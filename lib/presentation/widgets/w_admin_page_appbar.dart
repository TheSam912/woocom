import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class W_AdminPageAppBar extends StatelessWidget {
  W_AdminPageAppBar(
      {super.key,
      required this.pageTitle,
      required this.btnTitle,
      required this.selectedItems});

  String pageTitle;
  String btnTitle;
  List selectedItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            pageTitle,
            style: AppTextStyles.dynamicStyle(
              fontSize: 1.5.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Row(
              children: [
                selectedItems.isNotEmpty
                    ? Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 14),
                        margin: const EdgeInsets.only(right: 12),
                        child: Text(
                          "Selected: ${selectedItems.length}",
                          style: AppTextStyles.dynamicStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 1.sp,
                              color: AppColors.primary),
                        ),
                      )
                    : const Center(),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: 5),
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 14),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColors.primary,width: 1),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "Export",
                    style: AppTextStyles.dynamicStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 1.sp,
                        color: AppColors.primary),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    btnTitle,
                    style: AppTextStyles.dynamicStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 1.sp,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
