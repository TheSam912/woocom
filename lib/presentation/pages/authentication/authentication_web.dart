import 'package:ecommerce_woocom/core/constants/app_assets.dart';
import 'package:ecommerce_woocom/core/constants/app_colors.dart';
import 'package:ecommerce_woocom/core/constants/app_icons.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_tabBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../widgets/w_textField.dart';

class AuthenticationWeb extends StatefulWidget {
  const AuthenticationWeb({super.key});

  @override
  State<AuthenticationWeb> createState() => _AuthenticationWebState();
}

class _AuthenticationWebState extends State<AuthenticationWeb>
    with SingleTickerProviderStateMixin {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _adminEmailController = TextEditingController();
  final _adminPasswordController = TextEditingController();
  late TabController _tabController;
  bool _isLogin = true;

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
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
            width: size.width,
            height: size.height,
            child: Stack(
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 5,
                      child: Container(),
                    ),
                    Flexible(
                      flex: 5,
                      child: Container(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    width: size.width / 1.5,
                    height: 700,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(width: 5, color: AppColors.primary)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 4,
                          child: Container(
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
                                    fontSize: 2.5.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primary,
                                  ),
                                ),
                                Text(
                                  _isLogin
                                      ? "Log into your account"
                                      : "Create New Account",
                                  style: AppTextStyles.dynamicStyle(
                                    fontSize: 0.9.sp,
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
                                          isWeb: true,
                                          isTablet: false,
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
                                    isWeb: true,
                                    isTablet: false,
                                  ),
                                  const SizedBox(height: 10),
                                  W_TextFieldWidget(
                                    title: "Admin Password ...",
                                    inputType: TextInputType.visiblePassword,
                                    hint: "ABC123",
                                    icon: AppIcons.password,
                                    controller: _adminPasswordController,
                                    isWeb: true,
                                    isTablet: false,
                                  ),
                                ] else
                                  ..._isLogin
                                      ? [
                                          W_TextFieldWidget(
                                            title: "Email Address ...",
                                            inputType:
                                                TextInputType.emailAddress,
                                            hint: "alex@email.com",
                                            icon: AppIcons.mail,
                                            controller: _emailController,
                                            isWeb: true,
                                            isTablet: false,
                                          ),
                                          const SizedBox(height: 10),
                                          W_TextFieldWidget(
                                            title: "Password ...",
                                            inputType:
                                                TextInputType.visiblePassword,
                                            hint: "ABC123",
                                            icon: AppIcons.password,
                                            controller: _passwordController,
                                            isWeb: true,
                                            isTablet: false,
                                          ),
                                        ]
                                      : [
                                          W_TextFieldWidget(
                                            title: "Email Address ...",
                                            inputType:
                                                TextInputType.emailAddress,
                                            hint: "alex@email.com",
                                            icon: AppIcons.mail,
                                            controller: _emailController,
                                            isWeb: true,
                                            isTablet: false,
                                          ),
                                          const SizedBox(height: 10),
                                          W_TextFieldWidget(
                                            title: "Password ...",
                                            inputType:
                                                TextInputType.visiblePassword,
                                            hint: "ABC123",
                                            icon: AppIcons.password,
                                            controller: _passwordController,
                                            isWeb: true,
                                            isTablet: false,
                                          ),
                                          const SizedBox(height: 10),
                                          W_TextFieldWidget(
                                            title: "Confirm Password ...",
                                            inputType:
                                                TextInputType.visiblePassword,
                                            hint: "ABC123",
                                            icon: AppIcons.password,
                                            controller:
                                                _confirmPasswordController,
                                            isWeb: true,
                                            isTablet: false,
                                          ),
                                        ],
                                _isLogin
                                    ? Container(
                                        width: double.infinity,
                                        margin: const EdgeInsets.only(
                                            right: 20, top: 12),
                                        child: Text(
                                          "Forget Passowrd",
                                          textAlign: TextAlign.right,
                                          style: AppTextStyles.dynamicStyle(
                                              fontSize: 1.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.primary),
                                        ),
                                      )
                                    : const Center(),
                                const SizedBox(
                                  height: 30,
                                ),
                                _isLogin
                                    ? _buttonWidget("Login Now", () {}, true)
                                    : _buttonWidget("SignUp Now", () {}, true),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  child: Row(
                                    children: [
                                      _tabController.index == 0
                                          ? Flexible(
                                              flex: 4,
                                              child: Container(
                                                height: 3,
                                                margin: const EdgeInsets.only(
                                                    left: 20),
                                                color: Colors.grey.shade200,
                                              ),
                                            )
                                          : const Center(),
                                      _tabController.index == 0
                                          ? Text(
                                              "OR",
                                              style: AppTextStyles.dynamicStyle(
                                                  fontSize: 1.sp,
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          : const Center(),
                                      _tabController.index == 0
                                          ? Flexible(
                                              flex: 4,
                                              child: Container(
                                                height: 3,
                                                margin: const EdgeInsets.only(
                                                    right: 20),
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
                                          }, false)
                                        : _buttonWidget("Login", () {
                                            setState(() {
                                              _isLogin = !_isLogin;
                                            });
                                          }, false)
                                    : const Center(),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 6,
                          child: Container(
                            padding: const EdgeInsets.all(70),
                            decoration: const BoxDecoration(
                              color: Color(0xffF1F3F6),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                            ),
                            alignment: Alignment.center,
                            child: Image.asset(AppAssets.signIn_image),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )));
  }

  _buttonWidget(String text, VoidCallback onTap, isSingIn) => GestureDetector(
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
                fontSize: 1.sp,
                fontWeight: FontWeight.w600,
                color: isSingIn ? Colors.white : AppColors.primary),
          ),
        ),
      );
}
