import 'package:ecommerce_woocom/core/repository/product_respository.dart';
import 'package:ecommerce_woocom/data/enum/order_type.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_admin_page_appbar.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_admin_page_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/providers/w_product_provider.dart';
import '../provider/on_check_proovider.dart';

class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider);
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
                pageTitle: "Products",
                btnTitle: "+ Add Product",
                selectedItems: selectedItems),
            // W_AdminPageList(
            //   // listItems: ProductRepository.productList,
            //   listItems: products,
            //   orderType: OrderType.product,
            //   selectedItems: selectedItems,
            //   onChecked: selectionNotifier.toggleSelection,
            // )
            products.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) =>
                  Center(child: Text("Error: $error")),
              data: (products) {
                if (products.isEmpty) {
                  return const Center(child: Text("No products found"));
                }
                return W_AdminPageList(
                  listItems: products,
                  orderType: OrderType.product,
                  selectedItems: selectedItems,
                  onChecked: selectionNotifier.toggleSelection,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
