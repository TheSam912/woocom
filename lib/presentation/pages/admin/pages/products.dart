import 'package:ecommerce_woocom/core/repository/product_respository.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_admin_page_appbar.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_admin_page_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/on_check_proovider.dart';

class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({super.key});

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
                pageTitle: "Products",
                btnTitle: "+ Add Product",
                selectedItems: selectedItems),
            W_AdminPageList(
              listItems: ProductRepository.productList,
              selectedItems: selectedItems,
              onChecked: selectionNotifier.toggleSelection,
            )
          ],
        ),
      ),
    );
  }
}
