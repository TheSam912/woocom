import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

W_DrawerWidgetTablet(BuildContext context, bool isTablet,
        GlobalKey<ScaffoldState> scaffoldKey) =>
    Drawer(
      width: isTablet ? 300 : 250,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(top: 30, bottom: 30, left: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.primary,
              width: 6,
            )),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _profileSection(context, isTablet),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Top Categories",
                  style: AppTextStyles.dynamicStyle(
                      fontSize: isTablet ? 3.2.sp : 13.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary),
                ),
                w_listTile(context, "Skincare", () {
                  scaffoldKey.currentState?.closeDrawer();
                  context.pushNamed("category");
                }, isTablet),
                w_listTile(context, "Apparels", () {
                  scaffoldKey.currentState?.closeDrawer();
                  context.pushNamed("category");
                }, isTablet),
                w_listTile(context, "Jewellery", () {
                  scaffoldKey.currentState?.closeDrawer();
                  context.pushNamed("category");
                }, isTablet),
                w_listTile(context, "Handbags", () {
                  scaffoldKey.currentState?.closeDrawer();
                  context.pushNamed("category");
                }, isTablet),
                w_listTile(context, "Eyewear", () {
                  scaffoldKey.currentState?.closeDrawer();
                  context.pushNamed("category");
                }, isTablet),
                w_listTile(context, "Fragrance", () {
                  scaffoldKey.currentState?.closeDrawer();
                  context.pushNamed("category");
                }, isTablet),
                w_listTile(context, "Watches", () {
                  scaffoldKey.currentState?.closeDrawer();
                  context.pushNamed("category");
                }, isTablet),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Contact And About Us",
                  style: AppTextStyles.dynamicStyle(
                      fontSize: isTablet ? 3.2.sp : 13.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary),
                ),
                w_listTile(context, "About Us", () {
                  scaffoldKey.currentState?.closeDrawer();
                }, isTablet),
                w_listTile(context, "Contact Us", () {
                  scaffoldKey.currentState?.closeDrawer();
                }, isTablet),
                w_listTile(context, "Help & Support", () {
                  scaffoldKey.currentState?.closeDrawer();
                }, isTablet),
                w_listTile(context, "Suggestions", () {
                  scaffoldKey.currentState?.closeDrawer();
                }, isTablet),
              ],
            ),
          ),
        ),
      ),
    );

_profileSection(BuildContext context, isTablet) => GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        context.pushNamed("profile");
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: AppColors.accent),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: isTablet ? 25 : 20,
                  backgroundColor: AppColors.primary,
                  child: Text(
                    "S",
                    style: AppTextStyles.dynamicStyle(
                      fontSize: isTablet ? 6.sp : 12.sp,
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
      ),
    );

w_listTile(context, String title, VoidCallback onTap, isTablet) => ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: AppTextStyles.dynamicStyle(
            fontSize: isTablet ? 3.sp : 12.sp,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade600),
      ),
      trailing: const Icon(
        Icons.keyboard_arrow_right_sharp,
        color: AppColors.primary,
      ),
    );
