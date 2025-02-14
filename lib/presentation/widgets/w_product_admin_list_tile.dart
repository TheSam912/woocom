import 'package:ecommerce_woocom/core/constants/app_assets.dart';
import 'package:ecommerce_woocom/core/constants/app_colors.dart';
import 'package:ecommerce_woocom/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class W_ProductAdminListTile extends StatefulWidget {
  final String title;
  final double price;
  final double discount;
  final int inventory;
  final String imageUrl;
  final Color color;
  final bool isSelected;
  final Function(bool?) onChecked;

  const W_ProductAdminListTile({
    Key? key,
    required this.title,
    required this.price,
    required this.discount,
    required this.inventory,
    required this.imageUrl,
    required this.color,
    required this.isSelected,
    required this.onChecked,
  }) : super(key: key);

  @override
  _W_ProductAdminListTileState createState() => _W_ProductAdminListTileState();
}

class _W_ProductAdminListTileState extends State<W_ProductAdminListTile> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
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
                            width: 60,
                            height: 60,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(widget.imageUrl,
                                    fit: BoxFit.contain)),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            widget.title,
                            style: AppTextStyles.dynamicStyle(
                                fontSize: 0.9.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                _buildTextItem("\$${widget.inventory}"),
                _buildTextItem("\$${widget.price}"),
                _buildTextItem("\$${widget.discount}"),
                _buildEditButtons()
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

  _buildTextItem(title) => Flexible(
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

  _buildEditButtons() => Flexible(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.primary),
                width: 30,
                height: 30,
                child: Image.asset(
                  AppAssets.btnEdit,
                  fit: BoxFit.contain,
                )),
            const SizedBox(
              width: 8,
            ),
            Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.primary),
                child: Image.asset(
                  AppAssets.btnDelete,
                  fit: BoxFit.contain,
                ))
          ],
        ),
      ));
}
