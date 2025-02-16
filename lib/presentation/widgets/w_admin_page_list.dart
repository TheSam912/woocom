import 'package:ecommerce_woocom/presentation/widgets/w_customer_admin_list_tile.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_order_admin_list_tile.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_product_admin_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/enum/order_type.dart';

class W_AdminPageList extends StatefulWidget {
  W_AdminPageList(
      {super.key,
      required this.listItems,
      required this.orderType,
      required this.selectedItems,
      required this.onChecked});

  List listItems;
  OrderType orderType;
  final List selectedItems;
  final Function(String, bool?) onChecked;

  @override
  State<W_AdminPageList> createState() => _W_AdminPageListState();
}

class _W_AdminPageListState extends State<W_AdminPageList> {
  @override
  Widget build(BuildContext context) {
    final orderType = widget.orderType;
    return ListView.builder(
        itemCount: widget.listItems.length + 1,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          if (index == 0) {
            if (orderType == OrderType.product) {
              return _buildFirstFixItemProduct();
            } else if (orderType == OrderType.order) {
              return _buildFirstFixItemOrder();
            } else if (orderType == OrderType.customer) {
              return _buildFirstFixItemCustomer();
            }
          } else {
            final item = widget.listItems[index - 1];
            if (orderType == OrderType.product) {
              return W_ProductAdminListTile(
                title: item.headline,
                price: item.price,
                discount: item.priceSale,
                inventory: item.quantity,
                imageUrl: item.images[0],
                color: AppColors.primary,
                isSelected: widget.selectedItems
                    .contains(widget.listItems[index - 1].id.toString()),
                onChecked: (isChecked) =>
                    widget.onChecked(item.id.toString(), isChecked),
              );
            } else if (orderType == OrderType.order) {
              return W_OrderAdminListTile(
                id: item.id,
                orderId: item.orderId,
                date: item.date,
                customer: item.customer,
                payStatus: item.payStatus,
                orderStatus: item.orderStatus,
                total: item.total,
                isSelected: widget.selectedItems
                    .contains(widget.listItems[index - 1].id.toString()),
                onChecked: (isChecked) =>
                    widget.onChecked(item.id.toString(), isChecked),
              );
            } else if (orderType == OrderType.customer) {
              return W_CustomerAdminListTile(
                name: item.name,
                location: item.location,
                orders: item.order,
                spent: item.spent,
                isSelected: widget.selectedItems
                    .contains(widget.listItems[index - 1].id.toString()),
                onChecked: (isChecked) =>
                    widget.onChecked(item.id.toString(), isChecked),
              );
            }
          }
          return null;
        });
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

  Widget _buildFirstFixItemProduct() => Column(
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

  Widget _buildFirstFixItemOrder() => Column(
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
                        "Order",
                        style: AppTextStyles.dynamicStyle(
                            fontSize: 1.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade600),
                      ),
                    ),
                  ],
                ),
              ),
              _buildHeaderItem("Date"),
              _buildHeaderItem("Custom"),
              _buildHeaderItem("Payment Status"),
              _buildHeaderItem("Order Status"),
              _buildHeaderItem("Total"),
            ],
          ),
          Divider(
            color: Colors.grey.shade400,
            thickness: 1,
            endIndent: 14,
          ),
        ],
      );

  Widget _buildFirstFixItemCustomer() => Column(
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
                        "Name",
                        style: AppTextStyles.dynamicStyle(
                            fontSize: 1.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade600),
                      ),
                    ),
                  ],
                ),
              ),
              _buildHeaderItem("Location"),
              _buildHeaderItem("Orders"),
              _buildHeaderItem("Spent"),
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
}
