import 'package:ecommerce_woocom/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class W_CustomerAdminListTile extends StatefulWidget {
  const W_CustomerAdminListTile({
    super.key,
    required this.name,
    required this.location,
    required this.orders,
    required this.spent,
    required this.isSelected,
    required this.onChecked,
  });

  final String name;
  final String location;
  final int orders;
  final double spent;
  final bool isSelected;
  final Function(bool?) onChecked;

  @override
  State<W_CustomerAdminListTile> createState() =>
      _W_CustomerAdminListTileState();
}

class _W_CustomerAdminListTileState extends State<W_CustomerAdminListTile> {
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
                            child: CircleAvatar(
                              backgroundColor:
                                  AppColors.primary.withOpacity(0.5),
                              child: Text(
                                widget.name.substring(0, 1),
                                style: AppTextStyles.dynamicStyle(
                                    fontSize: 1.5.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            widget.name,
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
                _buildTextItem(widget.location),
                _buildTextItem("${widget.orders}"),
                _buildTextItem("\$${widget.spent}"),
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
