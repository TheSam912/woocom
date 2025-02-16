import 'package:ecommerce_woocom/core/constants/app_colors.dart';
import 'package:ecommerce_woocom/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/enum/order_payment_status.dart';
import '../../data/enum/order_status.dart';

class W_OrderAdminListTile extends StatefulWidget {
  final int id;
  final String orderId;
  final String date;
  final String customer;
  final OrderPaymentStatus payStatus;
  final OrderStatus orderStatus;
  final double total;
  final bool isSelected;
  final Function(bool?) onChecked;

  const W_OrderAdminListTile({
    Key? key,
    required this.id,
    required this.orderId,
    required this.date,
    required this.customer,
    required this.payStatus,
    required this.orderStatus,
    required this.total,
    required this.isSelected,
    required this.onChecked,
  }) : super(key: key);

  @override
  _W_OrderAdminListTileState createState() => _W_OrderAdminListTileState();
}

class _W_OrderAdminListTileState extends State<W_OrderAdminListTile> {
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
                      Text(
                        widget.orderId,
                        style: AppTextStyles.dynamicStyle(
                            fontSize: 0.8.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                _buildTextItem(widget.date),
                _buildTextItem(widget.customer),
                _buildBoxStatus(widget.payStatus.name),
                _buildBoxStatus(widget.orderStatus.name),
                _buildTextItem("\$${widget.total}"),
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
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
        ),
      );

  Color _getBoxStatusColor(String text) {
    switch (text) {
      case "paid":
        return AppColors.paid;
      case "pending":
        return AppColors.pending;
      case "failed":
        return Colors.red.withOpacity(0.8);
      case "orderReady":
        return AppColors.ready;
      case "orderShipped":
        return AppColors.shipped;
      case "orderReceived":
        return AppColors.received;
      case "orderCanceled":
        return Colors.redAccent;
      default:
        return Colors.transparent; // Default color
    }
  }

  _buildBoxStatus(text) {
    return Flexible(
        flex: 4,
        child: Container(
          alignment: Alignment.center,
          child: Container(
            width: 70,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: _getBoxStatusColor(text)),
            child: Text(
              text.length > 7 ? text.substring(5) : text,
              style: AppTextStyles.dynamicStyle(
                  fontSize: 0.8.sp,
                  fontWeight: FontWeight.w500,
                  color: text.length > 7 ? Colors.white : Colors.black),
            ),
          ),
        ));
  }
}
