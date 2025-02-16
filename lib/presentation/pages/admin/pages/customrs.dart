import 'package:ecommerce_woocom/core/repository/customer_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/enum/order_type.dart';
import '../../../widgets/w_admin_page_appbar.dart';
import '../../../widgets/w_admin_page_list.dart';
import '../provider/on_check_proovider.dart';

class CustomersScreen extends ConsumerWidget {
  const CustomersScreen({super.key});

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
                pageTitle: "Customers",
                btnTitle: "+ Add Customer",
                selectedItems: selectedItems),
            W_AdminPageList(
              listItems: CustomerRepository.customerList,
              orderType: OrderType.customer,
              selectedItems: selectedItems,
              onChecked: selectionNotifier.toggleSelection,
            )
          ],
        ),
      ),
    );
  }
}
