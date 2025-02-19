import 'package:ecommerce_woocom/core/routes/routes.dart';
import 'package:ecommerce_woocom/core/utils/responsive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../authentication/provider/auth_provider.dart';

class ProfileMobile extends ConsumerWidget {
  const ProfileMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isTablet = ResponsiveHelper.isTablet(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Profile"),
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            profileSection(context, ref, isTablet),
            _listTile(context, "Personal Information", isTablet),
            _listTile(context, "Refer and Earn", isTablet),
            _listTile(context, "My Orders", isTablet),
            _listTile(context, "My Wishlist", isTablet),
            _listTile(context, "My Reviews", isTablet),
            _listTile(context, "My Address Book", isTablet),
            _listTile(context, "My Saved Cards", isTablet),
          ]),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _logoutButton(context, ref, size, isTablet));
  }

  Widget profileSection(BuildContext context, WidgetRef ref, isTablet) =>
      Container(
        margin:
            EdgeInsets.symmetric(horizontal: isTablet ? 24 : 14, vertical: 12),
        padding: EdgeInsets.all(isTablet ? 20 : 14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: AppColors.accent),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.primary,
                  child: Text(
                    "S",
                    style: AppTextStyles.dynamicStyle(
                      fontSize: isTablet ? 6.sp : 20.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "Sophia Rose",
                  style: AppTextStyles.dynamicStyle(
                    fontSize: isTablet ? 3.sp : 12.sp,
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const Icon(
              Icons.keyboard_arrow_right_outlined,
              color: AppColors.primary,
            )
          ],
        ),
      );

  _listTile(context, String title, isTablet) => Padding(
        padding: EdgeInsets.symmetric(
            horizontal: isTablet ? 14 : 5, vertical: isTablet ? 5 : 0),
        child: ListTile(
          onTap: () {},
          title: Text(
            title,
            style: AppTextStyles.dynamicStyle(
                fontSize: isTablet ? 3.5.sp : 12.sp,
                fontWeight: FontWeight.w700,
                color: Colors.grey.shade800),
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right_sharp,
            color: Colors.grey.shade800,
          ),
        ),
      );

  _logoutButton(BuildContext context, WidgetRef ref, size, isTablet) =>
      GestureDetector(
        onTap: () {
          ref.read(authRepositoryProvider).signOut();
          context.pop(context);
        },
        child: Container(
          height: 50,
          width: size.width / 2,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.primary, width: 3),
              borderRadius: BorderRadius.circular(8),
              color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.logout,
                color: AppColors.primary,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "Logout",
                style: AppTextStyles.dynamicStyle(
                    fontSize: isTablet ? 3.5.sp : 14.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary),
              ),
            ],
          ),
        ),
      );
}
