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
    final type = ref.watch(loginUserType);
    print(type);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return authState.when(
          data: (user) {
            return LayoutBuilder(
              builder: (context, constraints) {
                if (user == null) {
                  if (ResponsiveHelper.isDesktop(context)) {
                    return const AuthenticationWeb();
                  } else if (ResponsiveHelper.isTablet(context)) {
                    return AuthenticationMobile(isTablet: true);
                  } else {
                    return AuthenticationMobile(isTablet: false);
                  }
                } else if (type == "user") {
                  if (ResponsiveHelper.isDesktop(context)) {
                    return const ProfileWeb();
                  } else {
                    return const ProfileMobile();
                  }
                } else {
                  if (ResponsiveHelper.isDesktop(context)) {
                    return const AdminWeb();
                  } else {
                    return const AdminWeb();
                  }
                }
              },
            );
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
