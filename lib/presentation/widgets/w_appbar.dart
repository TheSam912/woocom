import 'package:ecommerce_woocom/app.dart';
import 'package:ecommerce_woocom/core/constants/app_colors.dart';
import 'package:ecommerce_woocom/presentation/pages/authentication/authentication.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_iconButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_icons.dart';
import '../../core/constants/app_lists.dart';
import '../../core/constants/app_text_styles.dart';
import '../pages/basket/basket_web.dart';

class W_Appbar extends StatelessWidget {
  bool isTablet;

  W_Appbar({super.key, required this.isTablet});

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
                    onTap: () {},
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
                      const wIconButton(
                        iconPath: AppIcons.search,
                        color: Colors.grey,
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
                const SizedBox(
                  width: 12,
                ),
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
                const SizedBox(
                  width: 12,
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
