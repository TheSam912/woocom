import 'package:ecommerce_woocom/presentation/widgets/w_product_admin_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/repository/product_respository.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final List selectedItems = [];

  void _onChecked(String id, bool? isChecked) {
    setState(() {
      if (isChecked == true) {
        selectedItems.add(id);
      } else {
        selectedItems.remove(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Products",
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
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 14),
                          decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(8)),
                          child: Text(
                            "+ Add Product",
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
            ),
            ListView.builder(
                itemCount: ProductRepository.productList.length + 1,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return _buildFirstFixItem();
                  } else {
                    final item = ProductRepository.productList[index - 1];
                    return W_ProductAdminListTile(
                      title: item.headline,
                      price: item.price,
                      discount: item.priceSale,
                      inventory: item.quantity,
                      imageUrl: item.images[0],
                      color: AppColors.primary,
                      isSelected: selectedItems.contains(ProductRepository
                          .productList[index - 1].id
                          .toString()),
                      onChecked: (isChecked) =>
                          _onChecked(item.id.toString(), isChecked),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }

  _buildHeaderItem(title) => Flexible(
        flex: 4,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            title,
            style: AppTextStyles.dynamicStyle(
                fontSize: 1.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600),
          ),
        ),
      );

  Widget _buildFirstFixItem() => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 4,
                child: Row(
                  children: [
                    const Checkbox(
                      value: false,
                      onChanged: null,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Text(
                        "Product",
                        style: AppTextStyles.dynamicStyle(
                            fontSize: 1.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade600),
                      ),
                    ),
                  ],
                ),
              ),
              _buildHeaderItem("Inventory"),
              _buildHeaderItem("Price"),
              _buildHeaderItem("Discount"),
              _hiddenItem()
            ],
          ),
          Divider(
            color: Colors.grey.shade400,
            thickness: 1,
            endIndent: 14,
          ),
        ],
      );

  _hiddenItem() => Flexible(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                width: 30,
                height: 30,
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                )),
            const SizedBox(
              width: 8,
            ),
            Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: const Icon(
                  Icons.delete_outline_outlined,
                  color: Colors.white,
                ))
          ],
        ),
      ));
}
