import 'package:ecommerce_woocom/presentation/widgets/w_product_admin_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class W_AdminPageList extends StatefulWidget {
  W_AdminPageList(
      {super.key,
      required this.listItems,
      required this.selectedItems,
      required this.onChecked});

  List listItems;
  final List selectedItems;
  final Function(String, bool?) onChecked;

  @override
  State<W_AdminPageList> createState() => _W_AdminPageListState();
}

class _W_AdminPageListState extends State<W_AdminPageList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.listItems.length + 1,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildFirstFixItem();
          } else {
            final item = widget.listItems[index - 1];
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
          }
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
