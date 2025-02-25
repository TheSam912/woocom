import 'package:ecommerce_woocom/core/constants/app_assets.dart';
import 'package:ecommerce_woocom/core/constants/app_colors.dart';
import 'package:ecommerce_woocom/core/constants/app_text_styles.dart';
import 'package:ecommerce_woocom/data/models/product_model.dart';
import 'package:ecommerce_woocom/data/models/product_review_model.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_delete_product_dialog.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_edit_product_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../data/providers/w_product_provider.dart';

class W_ProductAdminListTile extends ConsumerStatefulWidget {
  final int productId;
  final String title;
  final String subHeadline;
  final String description;
  final String imageUrl;
  final int inventory;
  final double price;
  final double discount;
  final bool isSelected;
  final Color color;
  final Function(bool?) onChecked;

  const W_ProductAdminListTile({
    Key? key,
    required this.productId, // Add this
    required this.title,
    required this.subHeadline,
    required this.description,
    required this.imageUrl,
    required this.color,
    required this.inventory,
    required this.price,
    required this.discount,
    required this.isSelected,
    required this.onChecked,
  }) : super(key: key);

  @override
  _W_ProductAdminListTileState createState() => _W_ProductAdminListTileState();
}

class _W_ProductAdminListTileState
    extends ConsumerState<W_ProductAdminListTile> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        color: _isHovered ? Colors.grey[200] : Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 4,
                  child: Row(
                    children: [
                      Checkbox(
                        value: widget.isSelected,
                        onChanged: widget.onChecked,
                        checkColor: Colors.white,
                        activeColor: AppColors.primary,
                      ),
                      const SizedBox(width: 12),
                      Row(
                        children: [
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(widget.imageUrl,
                                  fit: BoxFit.contain),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            widget.title,
                            style: AppTextStyles.dynamicStyle(
                                fontSize: 0.8.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                _buildTextItem("${widget.inventory}"),
                _buildTextItem("\$${widget.price.toStringAsFixed(2)}"),
                _buildTextItem("\$${widget.discount.toStringAsFixed(2)}"),
                _buildEditButtons(),
              ],
            ),
            Divider(
              color: Colors.grey.shade200,
              thickness: 1,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextItem(String title) => Flexible(
        flex: 4,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            title,
            style: AppTextStyles.dynamicStyle(
                fontSize: 0.8.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        ),
      );

  Widget _buildEditButtons() => Flexible(
        flex: 4,
        child: Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  ProductModel tempProduct = ProductModel(
                      widget.productId,
                      widget.title,
                      widget.subHeadline,
                      widget.description,
                      1,
                      widget.price,
                      widget.discount,
                      widget.inventory,
                      [widget.imageUrl],
                      [ProductReviewModel(0, "", "", 1)]);
                  return showEditProductDialog(context, ref, tempProduct);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.primary,
                  ),
                  width: 30,
                  height: 30,
                  child: Image.asset(
                    AppAssets.btnEdit,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () async {
                  bool confirmDelete =
                      await showDeleteConfirmationDialog(context);
                  if (confirmDelete) {
                    await ref.read(productServiceProvider).deleteProduct(
                        widget.productId); // ✅ Use productId here
                    ref.invalidate(productProvider); // Refresh product list
                  }
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.primary,
                  ),
                  child: Image.asset(
                    AppAssets.btnDelete,
                    fit: BoxFit.contain,
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
