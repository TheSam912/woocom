import 'package:ecommerce_woocom/app.dart';
import 'package:ecommerce_woocom/core/constants/app_colors.dart';
import 'package:ecommerce_woocom/presentation/pages/authentication/authentication.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_iconButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_icons.dart';
import '../../core/constants/app_lists.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_text_styles.dart';
import '../pages/admin/admin_web.dart';
import '../pages/basket/basket_web.dart';

class W_Appbar extends StatelessWidget {
  bool isTablet;
  final GlobalKey<ScaffoldState> scaffoldKey;

  W_Appbar({super.key, required this.isTablet, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size(double.infinity, 100),
        child: Padding(
          padding:
              EdgeInsets.only(left: 14, right: 14, top: isTablet ? 16 : 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  wIconButton(
                    iconPath: AppIcons.menu,
                    color: AppColors.primary,
                    size: isTablet ? 18.r : 24.r,
                    onTap: () => scaffoldKey.currentState?.openDrawer(),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    "Woocom",
                    style: isTablet
                        ? AppTextStyles.dynamicStyle(
                            fontSize: 6.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textLight,
                          )
                        : AppTextStyles.dynamicStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textLight,
                          ),
                  )
                ],
              ),
              Row(
                children: [
                  wIconButton(
                    iconPath: AppIcons.search,
                    color: AppColors.primary,
                    size: isTablet ? 18.r : 24.r,
                    onTap: () {},
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  wIconButton(
                    iconPath: AppIcons.bag,
                    color: AppColors.primary,
                    size: isTablet ? 18.r : 24.r,
                    onTap: () => context.pushNamed("basket_mobile"),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  wIconButton(
                    iconPath: AppIcons.notification,
                    color: AppColors.primary,
                    size: isTablet ? 18.r : 24.r,
                    onTap: () {},
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  wIconButton(
                    iconPath: AppIcons.profile,
                    color: AppColors.primary,
                    size: isTablet ? 18.r : 24.r,
                    onTap: () => context.pushNamed("authentication"),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

wAppBarWeb(context, isMain) {
  return PreferredSize(
      preferredSize: const Size(double.infinity, 80),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if (!isMain) {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const App(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          settings: const RouteSettings(),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Woocom",
                    style: AppTextStyles.dynamicStyle(
                      fontSize: 2.5.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textLight,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 34,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: AppLists.categories.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: TextButton(
                        style: ButtonStyle(
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                            overlayColor:
                                WidgetStatePropertyAll(Colors.grey[200])),
                        onPressed: () {},
                        child: Text(
                          AppLists.categories[index],
                          style: AppTextStyles.webAppbarItems,
                        )),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  width: 350,
                  height: 60,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  margin: const EdgeInsets.only(right: 25),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.appbarGray),
                  child: Row(
                    children: [
                      Image.asset(
                        AppIcons.search,
                        width: 22.r,
                        height: 22.r,
                        color: Colors.grey,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Search for products or brands .....",
                        style: AppTextStyles.dynamicStyle(
                            color: AppColors.lightGray, fontSize: 0.95.sp),
                      )
                    ],
                  ),
                ),
                const wIconButton(iconPath: AppIcons.wishlist),
                wIconButton(
                  iconPath: AppIcons.profile,
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            Authentication(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                        settings: const RouteSettings(),
                      ),
                    );
                  },
                ),
                wIconButton(
                  iconPath: AppIcons.bag,
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) {
                      return w_BasketDialog(context);
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ));
}

class W_AppBarAdminPanel extends ConsumerStatefulWidget {
  const W_AppBarAdminPanel({super.key});

  @override
  ConsumerState<W_AppBarAdminPanel> createState() => _W_AppBarAdminPanelState();
}

class _W_AppBarAdminPanelState extends ConsumerState<W_AppBarAdminPanel> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
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
                Row(
                  children: [
                    MouseRegion(
                      onEnter: (_) => setState(() => isHovered = true),
                      onExit: (_) => setState(() => isHovered = false),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Tooltip(
                          message: "Preview Website",
                          textStyle: AppTextStyles.dynamicStyle(
                              fontSize: 0.8.sp, color: Colors.white),
                          child: GestureDetector(
                            onTap: () => context.pushNamed("app"),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 5),
                              decoration: BoxDecoration(
                                  color: isHovered
                                      ? Colors.white.withOpacity(0.2)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Image.asset(
                                AppIcons.open,
                                width: 25,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.2),
                      child: IconButton(
                        onPressed: () {
                          ref.read(selectedIndexProvider.notifier).state = 6;
                        },
                        icon: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
