import 'package:ecommerce_woocom/presentation/widgets/w_tabBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_icons.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../widgets/w_textField.dart';

class AuthenticationMobile extends StatefulWidget {
  AuthenticationMobile({super.key, required this.isTablet});

  bool isTablet;

  @override
  State<AuthenticationMobile> createState() => _AuthenticationMobileState();
}

class _AuthenticationMobileState extends State<AuthenticationMobile>
    with SingleTickerProviderStateMixin {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _adminEmailController = TextEditingController();
  final _adminPasswordController = TextEditingController();
  late TabController _tabController;
  bool _isLogin = true;
  late bool isTablet;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  void _login() {
    if (_tabController.index == 0) {
      Navigator.pushReplacementNamed(context, '/admin');
    } else {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    isTablet = widget.isTablet;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          Positioned(
              top: 40,
              right: 15,
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ))),
          Center(
            child: Container(
              height: isTablet ? 630 : 550,
              margin: EdgeInsets.symmetric(horizontal: isTablet ? 100 : 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  border: Border.all(width: 5, color: AppColors.primary)),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Woocom",
                          style: AppTextStyles.dynamicStyle(
                            fontSize: isTablet ? 10.sp : 22.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                        Text(
                          _isLogin
                              ? "Log into your account"
                              : "Create New Account",
                          style: AppTextStyles.dynamicStyle(
                            fontSize: isTablet ? 4.5.sp : 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textLight,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          child: _isLogin
                              ? W_TabBarWidget(
                                  controller: _tabController,
                                  isWeb: false,
                                  isTablet: isTablet,
                                )
                              : const Center(),
                        ),
                        if (_tabController.index == 1) ...[
                          W_TextFieldWidget(
                            title: "Admin Email Address ...",
                            hint: "alex@email.com",
                            icon: AppIcons.mail,
                            inputType: TextInputType.emailAddress,
                            controller: _adminEmailController,
                            isWeb: false,
                            isTablet: isTablet,
                          ),
                          const SizedBox(height: 10),
                          W_TextFieldWidget(
                            title: "Admin Password ...",
                            inputType: TextInputType.visiblePassword,
                            hint: "ABC123",
                            icon: AppIcons.password,
                            controller: _adminPasswordController,
                            isWeb: false,
                            isTablet: isTablet,
                          ),
                        ] else
                          ..._isLogin
                              ? [
                                  W_TextFieldWidget(
                                    title: "Email Address ...",
                                    inputType: TextInputType.emailAddress,
                                    hint: "alex@email.com",
                                    icon: AppIcons.mail,
                                    controller: _emailController,
                                    isWeb: false,
                                    isTablet: isTablet,
                                  ),
                                  const SizedBox(height: 10),
                                  W_TextFieldWidget(
                                    title: "Password ...",
                                    inputType: TextInputType.visiblePassword,
                                    hint: "ABC123",
                                    icon: AppIcons.password,
                                    controller: _passwordController,
                                    isWeb: false,
                                    isTablet: isTablet,
                                  ),
                                ]
                              : [
                                  W_TextFieldWidget(
                                    title: "Email Address ...",
                                    inputType: TextInputType.emailAddress,
                                    hint: "alex@email.com",
                                    icon: AppIcons.mail,
                                    controller: _emailController,
                                    isWeb: false,
                                    isTablet: isTablet,
                                  ),
                                  const SizedBox(height: 10),
                                  W_TextFieldWidget(
                                    title: "Password ...",
                                    inputType: TextInputType.visiblePassword,
                                    hint: "ABC123",
                                    icon: AppIcons.password,
                                    controller: _passwordController,
                                    isWeb: false,
                                    isTablet: isTablet,
                                  ),
                                  const SizedBox(height: 10),
                                  W_TextFieldWidget(
                                    title: "Confirm Password ...",
                                    inputType: TextInputType.visiblePassword,
                                    hint: "ABC123",
                                    icon: AppIcons.password,
                                    controller: _confirmPasswordController,
                                    isWeb: false,
                                    isTablet: isTablet,
                                  ),
                                ],
                        _isLogin
                            ? Container(
                                width: double.infinity,
                                margin:
                                    const EdgeInsets.only(right: 20, top: 12),
                                child: Text(
                                  "Forget Passowrd",
                                  textAlign: TextAlign.right,
                                  style: AppTextStyles.dynamicStyle(
                                      fontSize: isTablet ? 3.5.sp : 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primary),
                                ),
                              )
                            : const Center(),
                        const SizedBox(
                          height: 30,
                        ),
                        _isLogin
                            ? _buttonWidget("Login Now", () {}, true, isTablet)
                            : _buttonWidget(
                                "SignUp Now", () {}, true, isTablet),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Row(
                            children: [
                              _tabController.index == 0
                                  ? Flexible(
                                      flex: 4,
                                      child: Container(
                                        height: 3,
                                        margin: const EdgeInsets.only(left: 20),
                                        color: Colors.grey.shade200,
                                      ),
                                    )
                                  : const Center(),
                              _tabController.index == 0
                                  ? Text(
                                      "OR",
                                      style: AppTextStyles.dynamicStyle(
                                          fontSize: isTablet ? 3.sp : 12.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600),
                                    )
                                  : const Center(),
                              _tabController.index == 0
                                  ? Flexible(
                                      flex: 4,
                                      child: Container(
                                        height: 3,
                                        margin:
                                            const EdgeInsets.only(right: 20),
                                        color: Colors.grey.shade200,
                                      ),
                                    )
                                  : const Center()
                            ],
                          ),
                        ),
                        _tabController.index == 0
                            ? _isLogin
                                ? _buttonWidget("SingUp Now", () {
                                    setState(() {
                                      _isLogin = !_isLogin;
                                    });
                                  }, false, isTablet)
                                : _buttonWidget("Login", () {
                                    setState(() {
                                      _isLogin = !_isLogin;
                                    });
                                  }, false, isTablet)
                            : const Center(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _buttonWidget(String text, VoidCallback onTap, isSingIn, isTablet) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: isSingIn ? Colors.white : AppColors.primary, width: 2),
              color: isSingIn ? AppColors.primary : Colors.white),
          alignment: Alignment.center,
          child: Text(
            text,
            style: AppTextStyles.dynamicStyle(
                fontSize: isTablet ? 3.5.sp : 12.sp,
                fontWeight: FontWeight.w600,
                color: isSingIn ? Colors.white : AppColors.primary),
          ),
        ),
      );
}
