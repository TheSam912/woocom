import 'package:ecommerce_woocom/presentation/widgets/w_add_product_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class W_AdminPageAppBar extends ConsumerWidget {
  const W_AdminPageAppBar(
      {super.key,
      required this.pageTitle,
      required this.btnTitle,
      required this.selectedItems});

  final String pageTitle;
  final String btnTitle;
  final List selectedItems;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      border: Border.all(color: AppColors.primary, width: 1),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "Export",
                    style: AppTextStyles.dynamicStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 1.sp,
                        color: AppColors.primary),
                  ),
                ),
                GestureDetector(
                  onTap: () => showAddProductDialog(context, ref),
                  child: Container(
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      btnTitle,
                      style: AppTextStyles.dynamicStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 1.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                // GestureDetector(
                //   onTap: () async {
                //     final newProduct = ProductModel(5, "Grande", AppStrings.product2SubHeadline,
                //         AppStrings.product2Description, 5, 99.0, 24.99, 20, [
                //           "https://raw.githubusercontent.com/TheSam912/woocom/refs/heads/main/assets/assets/images/product/product2.png",
                //           "https://raw.githubusercontent.com/TheSam912/woocom/refs/heads/main/assets/assets/images/product/product2.png",
                //           "https://raw.githubusercontent.com/TheSam912/woocom/refs/heads/main/assets/assets/images/product/product2.png",
                //           "https://raw.githubusercontent.com/TheSam912/woocom/refs/heads/main/assets/assets/images/product/product2.png"
                //         ], [
                //           ProductReviewModel(0, "John Smith",
                //               "It has a perfect quality and the price is very good", 5),
                //           ProductReviewModel(0, "Julia Piacere",
                //               "It has a perfect quality and the price is very good", 3),
                //           ProductReviewModel(0, "Max Amoreni",
                //               "It has a perfect quality and the price is very good", 2),
                //           ProductReviewModel(0, "Jesica lorz",
                //               "It has a perfect quality and the price is very good", 5),
                //         ]);
                //     await ref
                //         .read(productServiceProvider)
                //         .addProduct(newProduct);
                //     ref.invalidate(
                //         productProvider); // Refresh product list after adding
                //   },
                //   child: Container(
                //     alignment: Alignment.center,
                //     padding:
                //         const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                //     decoration: BoxDecoration(
                //         color: AppColors.primary,
                //         borderRadius: BorderRadius.circular(5)),
                //     child: Text(
                //       btnTitle,
                //       style: AppTextStyles.dynamicStyle(
                //           fontWeight: FontWeight.w700,
                //           fontSize: 1.sp,
                //           color: Colors.white),
                //     ),
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
