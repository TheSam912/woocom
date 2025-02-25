import 'package:ecommerce_woocom/core/constants/app_assets.dart';
import 'package:ecommerce_woocom/core/constants/app_colors.dart';
import 'package:ecommerce_woocom/core/constants/app_icons.dart';
import 'package:ecommerce_woocom/core/constants/app_text_styles.dart';
import 'package:ecommerce_woocom/core/utils/responsive_helper.dart';
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
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/w_panel_side_item.dart';
import '../authentication/provider/auth_provider.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);

class AdminWeb extends ConsumerWidget {
  const AdminWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final selectedIndex = ref.watch(selectedIndexProvider);
    final isWeb = ResponsiveHelper.isDesktop(context);
    final isTablet = ResponsiveHelper.isTablet(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: isWeb
          ? const PreferredSize(
              preferredSize: Size(0, 100), child: W_AppBarAdminPanel())
          : AppBar(
              backgroundColor: Colors.white,
              leading: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
      body: isWeb
          ? Row(
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
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.back_to_main,
                    width: size.width / 2,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    "Whoops!",
                    style: AppTextStyles.dynamicStyle(
                        fontSize: isTablet ? 5.sp : 22.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: isTablet ? 14.0 : 24),
                    child: Text(
                      "You Couldn't Login As Admin With Your Phone Or Tablet. Please Login Via Laptop",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.dynamicStyle(
                          fontSize: isTablet ? 3.sp : 14.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary),
                    ),
                  ),
                ],
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () {
          ref.read(authRepositoryProvider).signOut();
          ref.invalidate(authStateProvider);
          context.goNamed('app');
        },
        child: Container(
          height: 50,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: isTablet ? 14 : 24),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: AppColors.primary),
          child: Text(
            "Back To Home",
            style: AppTextStyles.dynamicStyle(
                fontWeight: FontWeight.w700,
                fontSize: isTablet ? 3.sp : 12.sp,
                color: AppColors.accent),
          ),
        ),
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
            W_PanelSideItem(ref, 6, AppIcons.personal, "Settings"),
          ],
        ),
      );
}
