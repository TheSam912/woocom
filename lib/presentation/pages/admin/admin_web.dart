import 'package:ecommerce_woocom/core/constants/app_icons.dart';
import 'package:ecommerce_woocom/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);

class AdminWeb extends ConsumerWidget {
  const AdminWeb({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final selectedIndex = ref.watch(selectedIndexProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(75),
          child: Container(
            color: AppColors.primary,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.appName,
                    style: AppTextStyles.dynamicStyle(
                      fontSize: 2.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.2),
                    child: IconButton(
                      onPressed: () {
                        ref.read(selectedIndexProvider.notifier).state = 5;
                      },
                      icon: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 250,
            height: size.height,
            color: const Color(0xff1B4B66),
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                _buildMenuItem(ref, 0, AppIcons.dashboard, "Dashboard"),
                _buildMenuItem(ref, 1, AppIcons.orders, "Orders"),
                _buildMenuItem(ref, 2, AppIcons.products, "Products"),
                _buildMenuItem(ref, 3, AppIcons.categories, "Categories"),
                _buildMenuItem(ref, 4, AppIcons.customers, "Customers"),
                _buildMenuItem(ref, 5, AppIcons.personal, "Personal settings"),
              ],
            ),
          ),

          // Main Content
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
                  UsersScreen(),
                  SettingsScreen(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Sidebar Menu Item
  Widget _buildMenuItem(WidgetRef ref, int index, String icon, String title) {
    var selectedIndex = ref.watch(selectedIndexProvider);
    return GestureDetector(
      onTap: () {
        ref.read(selectedIndexProvider.notifier).state = index;
        selectedIndex = index;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: selectedIndex == index ? Colors.white : AppColors.primary,
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 20,
              color: selectedIndex == index ? AppColors.primary : Colors.white,
            ),
            const SizedBox(width: 8),
            Text(title,
                style: AppTextStyles.dynamicStyle(
                  color:
                      selectedIndex == index ? AppColors.primary : Colors.white,
                  fontSize: 0.9.sp,
                  fontWeight: selectedIndex == index
                      ? FontWeight.w700
                      : FontWeight.w500,
                ))
          ],
        ),
      ),
    );
  }
}

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Categories Screen");
  }
}

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Orders Screen");
  }
}

// Example Screens
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Dashboard Screen");
  }
}

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Products Screen");
  }
}

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Users Screen");
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Personal Settings Screen");
  }
}

// IconButton(
// icon: const Icon(
// Icons.logout,
// color: Colors.black,
// ),
// onPressed: () {
// ref.read(authRepositoryProvider).signOut();
// ref.invalidate(authStateProvider);
// },
// )
