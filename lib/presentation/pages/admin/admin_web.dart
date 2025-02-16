import 'package:ecommerce_woocom/core/constants/app_icons.dart';
import 'package:ecommerce_woocom/presentation/pages/admin/pages/brands.dart';
import 'package:ecommerce_woocom/presentation/pages/admin/pages/categories.dart';
import 'package:ecommerce_woocom/presentation/pages/admin/pages/customrs.dart';
import 'package:ecommerce_woocom/presentation/pages/admin/pages/dahsboard.dart';
import 'package:ecommerce_woocom/presentation/pages/admin/pages/orders.dart';
import 'package:ecommerce_woocom/presentation/pages/admin/pages/personal.dart';
import 'package:ecommerce_woocom/presentation/pages/admin/pages/products.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/w_panel_side_item.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);

class AdminWeb extends ConsumerWidget {
  const AdminWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final selectedIndex = ref.watch(selectedIndexProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
          preferredSize: Size(0, 100), child: W_AppBarAdminPanel()),
      body: Row(
        children: [
          _sideBar(size, ref),
          Expanded(
            child: Container(
              color: Colors.white,
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 24, top: 24),
              child: IndexedStack(
                index: selectedIndex,
                children: const [
                  DashboardScreen(),
                  OrdersScreen(),
                  ProductsScreen(),
                  CategoriesScreen(),
                  BrandsScreen(),
                  CustomersScreen(),
                  PersonalSettingsScreen(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _sideBar(size, WidgetRef ref) => Container(
        width: 250,
        height: size.height,
        color: const Color(0xff1B4B66),
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            W_PanelSideItem(ref, 0, AppIcons.dashboard, "Dashboard"),
            W_PanelSideItem(ref, 1, AppIcons.orders, "Orders"),
            W_PanelSideItem(ref, 2, AppIcons.products, "Products"),
            W_PanelSideItem(ref, 3, AppIcons.categories, "Categories"),
            W_PanelSideItem(ref, 4, AppIcons.brands, "Brands"),
            W_PanelSideItem(ref, 5, AppIcons.customers, "Customers"),
            W_PanelSideItem(ref, 6, AppIcons.personal, "Personal settings"),
          ],
        ),
      );
}
