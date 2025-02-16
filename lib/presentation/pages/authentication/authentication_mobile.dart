import 'package:ecommerce_woocom/presentation/pages/authentication/provider/auth_provider.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_tabBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_icons.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../widgets/w_textField.dart';

class AuthenticationMobile extends ConsumerStatefulWidget {
  const AuthenticationMobile({super.key, required this.isTablet});

  final bool isTablet;

  @override
  ConsumerState<AuthenticationMobile> createState() =>
      _AuthenticationMobileState();
}

class _AuthenticationMobileState extends ConsumerState<AuthenticationMobile>
    with SingleTickerProviderStateMixin {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _adminEmailController = TextEditingController();
  final _adminPasswordController = TextEditingController();
  late final TabController _tabController;
  bool _isLogin = true;
  bool _isForgetPassword = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this)
      ..addListener(() => setState(() {}));
  }

  Future<void> _login(String type) async {
    final email = type == "admin"
        ? _adminEmailController.text.trim()
        : _emailController.text.trim();
    final password = type == "admin"
        ? _adminPasswordController.text.trim()
        : _passwordController.text.trim();

    try {
      await ref.read(authRepositoryProvider).signIn(email, password);
    } catch (e) {
      _showSnackBar(e.toString());
    }
  }

  Future<void> _register() async {
    if (_passwordController.text.trim() !=
        _confirmPasswordController.text.trim()) {
      _showSnackBar("Passwords do not match");
      return;
    }

    try {
      final user = await ref.read(authRepositoryProvider).signUp(
            _emailController.text.trim(),
            _passwordController.text.trim(),
          );
      if (user != null) {
        _showSnackBar("Registration successful!");
        setState(() => _isLogin = true);
      }
    } catch (e) {
      _showSnackBar(e.toString());
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = widget.isTablet;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        children: [
          Positioned(
            top: isTablet ? 40 : 30,
            right: 15,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close, color: Colors.white),
            ),
          ),
          Center(
            child: Container(
              height: _isForgetPassword
                  ? isTablet
                      ? 430
                      : 370
                  : isTablet
                      ? 630
                      : 550,
              margin: EdgeInsets.symmetric(horizontal: isTablet ? 100 : 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border.all(width: 5, color: AppColors.primary),
              ),
              child: Column(
                children: [
                  _buildHeader(isTablet),
                  _isForgetPassword
                      ? _buildForgetPassword(isTablet)
                      : _buildAuthentication(isTablet)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAuthentication(isTablet) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: _isLogin
              ? W_TabBarWidget(
                  controller: _tabController, isWeb: false, isTablet: isTablet)
              : const SizedBox(),
        ),
        _buildFormFields(isTablet),
        _isLogin ? _forgotPasswordButton(isTablet) : const SizedBox(height: 30),
        _buildActionButton(isTablet),
        _buildOrLine(isTablet),
        _isLogin ? _buildSignupOption(isTablet) : _buildSignupOption(isTablet)
      ],
    );
  }

  Widget _buildForgetPassword(isTablet) {
    return Column(
      children: [
        W_TextFieldWidget(
          title: "Email Address",
          hint: "alex@email.com",
          icon: AppIcons.mail,
          inputType: TextInputType.emailAddress,
          controller: _adminEmailController,
          isWeb: false,
          isTablet: isTablet,
        ),
        const SizedBox(height: 25),
        _buttonWidget(
          "Send Reset Link",
          () {},
          true,
          isTablet,
        ),
        _buildOrLine(isTablet),
        _buttonWidget(
          "Login With Existing Account",
          () => setState(() => _isForgetPassword = !_isForgetPassword),
          false,
          isTablet,
        )
      ],
    );
  }

  Widget _buildHeader(bool isTablet) {
    return Container(
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
            _isForgetPassword
                ? "Reset Password"
                : _isLogin
                    ? "Log into your account"
                    : "Create New Account",
            style: AppTextStyles.dynamicStyle(
              fontSize: isTablet ? 4.5.sp : 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textLight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormFields(bool isTablet) {
    if (_tabController.index == 1) {
      return Column(
        children: [
          W_TextFieldWidget(
            title: "Admin Email Address",
            hint: "alex@email.com",
            icon: AppIcons.mail,
            inputType: TextInputType.emailAddress,
            controller: _adminEmailController,
            isWeb: false,
            isTablet: isTablet,
          ),
          const SizedBox(height: 10),
          W_TextFieldWidget(
            title: "Admin Password",
            inputType: TextInputType.visiblePassword,
            hint: "ABC123",
            icon: AppIcons.password,
            controller: _adminPasswordController,
            isWeb: false,
            isTablet: isTablet,
          ),
        ],
      );
    } else {
      return Column(
        children: [
          W_TextFieldWidget(
            title: "Email Address",
            inputType: TextInputType.emailAddress,
            hint: "alex@email.com",
            icon: AppIcons.mail,
            controller: _emailController,
            isWeb: false,
            isTablet: isTablet,
          ),
          const SizedBox(height: 10),
          W_TextFieldWidget(
            title: "Password",
            inputType: TextInputType.visiblePassword,
            hint: "ABC123",
            icon: AppIcons.password,
            controller: _passwordController,
            isWeb: false,
            isTablet: isTablet,
          ),
          if (!_isLogin) ...[
            const SizedBox(height: 10),
            W_TextFieldWidget(
              title: "Confirm Password",
              inputType: TextInputType.visiblePassword,
              hint: "ABC123",
              icon: AppIcons.password,
              controller: _confirmPasswordController,
              isWeb: false,
              isTablet: isTablet,
            ),
          ],
        ],
      );
    }
  }

  Widget _forgotPasswordButton(bool isTablet) {
    return GestureDetector(
      onTap: () => setState(() => _isForgetPassword = !_isForgetPassword),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(right: 20, top: 12, bottom: 20),
        child: Text(
          "Forgot Password",
          textAlign: TextAlign.right,
          style: AppTextStyles.dynamicStyle(
            fontSize: isTablet ? 3.5.sp : 12.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(bool isTablet) {
    return _buttonWidget(
      _isLogin ? "Login Now" : "Sign Up Now",
      () => _isLogin
          ? _login(_tabController.index == 1 ? "admin" : "user")
          : _register(),
      true,
      isTablet,
    );
  }

  Widget _buildSignupOption(bool isTablet) {
    return _buttonWidget(
      _isLogin ? "Sign Up Now" : "Login",
      () => setState(() => _isLogin = !_isLogin),
      false,
      isTablet,
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

  _buildOrLine(isTablet) => Padding(
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
                      margin: const EdgeInsets.only(right: 20),
                      color: Colors.grey.shade200,
                    ),
                  )
                : const Center()
          ],
        ),
      );
}
