import 'package:ecommerce_woocom/core/repository/order_repository.dart';
import 'package:ecommerce_woocom/data/enum/order_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../widgets/w_admin_page_appbar.dart';
import '../../../widgets/w_admin_page_list.dart';
import '../provider/on_check_proovider.dart';

class OrdersScreen extends ConsumerWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItems = ref.watch(selectionProvider);
    final selectionNotifier = ref.read(selectionProvider.notifier);
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            W_AdminPageAppBar(
                pageTitle: "Orders",
                btnTitle: "+ Add Order",
                selectedItems: selectedItems),
            W_AdminPageList(
              listItems: OrderRepository.orderList,
              orderType: OrderType.order,
              selectedItems: selectedItems,
              onChecked: selectionNotifier.toggleSelection,
            )
          ],
        ),
      ),
    );
  }
}
