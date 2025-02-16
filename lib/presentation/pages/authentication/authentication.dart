import 'package:ecommerce_woocom/presentation/pages/admin/admin_web.dart';
import 'package:ecommerce_woocom/presentation/pages/authentication/provider/auth_provider.dart';
import 'package:ecommerce_woocom/presentation/pages/profile/profile_mobile.dart';
import 'package:ecommerce_woocom/presentation/pages/profile/profile_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/responsive_helper.dart';
import 'authentication_mobile.dart';
import 'authentication_web.dart';

class Authentication extends ConsumerWidget {
  Authentication({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return authState.when(
          data: (data) {
            if (data == null) {
              // Show authentication screen
              if (ResponsiveHelper.isDesktop(context)) {
                return const AuthenticationWeb();
              } else if (ResponsiveHelper.isTablet(context)) {
                return const AuthenticationMobile(isTablet: true);
              } else {
                return const AuthenticationMobile(isTablet: false);
              }
            } else {
              // Redirect based on role
              String role = data["role"];

              if (role == "admin") {
                return const AdminWeb();
              } else {
                if (ResponsiveHelper.isDesktop(context)) {
                  return const ProfileWeb();
                } else {
                  return const ProfileMobile();
                }
              }
            }
          },
          error: (error, stackTrace) =>
              Scaffold(body: Center(child: Text("Error: $error"))),
          loading: () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
        );
      },
    );
  }
}
