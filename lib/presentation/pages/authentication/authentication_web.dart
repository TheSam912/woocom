import 'package:ecommerce_woocom/core/constants/app_assets.dart';
import 'package:ecommerce_woocom/core/constants/app_colors.dart';
import 'package:ecommerce_woocom/core/constants/app_icons.dart';
import 'package:ecommerce_woocom/presentation/pages/authentication/provider/auth_provider.dart';
import 'package:ecommerce_woocom/presentation/widgets/w_tabBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../widgets/w_textField.dart';

class AuthenticationWeb extends ConsumerStatefulWidget {
  const AuthenticationWeb({super.key});

  @override
  ConsumerState<AuthenticationWeb> createState() => _AuthenticationWebState();
}

class _AuthenticationWebState extends ConsumerState<AuthenticationWeb>
    with SingleTickerProviderStateMixin {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _adminEmailController = TextEditingController();
  final _adminPasswordController = TextEditingController();
  late TabController _tabController;
  bool _isLogin = true;
  bool _isForgetPassword = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  Future<void> _login(BuildContext context, String type) async {
    final email = type == "admin"
        ? _adminEmailController.text.trim()
        : _emailController.text.trim();
    final password = type == "admin"
        ? _adminPasswordController.text.trim()
        : _passwordController.text.trim();

    try {
      await ref.read(authRepositoryProvider).signIn(email, password);

      ref.invalidate(authStateProvider);
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
    if (!mounted) return;
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            _buildBackground(),
            Center(
              child: _buildMainContainer(size),
            ),
            Positioned(
                top: 20,
                right: 20,
                child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ))),
          ],
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return Row(
      children: [
        Flexible(flex: 5, child: Container()),
        Flexible(flex: 5, child: Container(color: AppColors.primary)),
      ],
    );
  }

  Widget _buildMainContainer(Size size) {
    return Container(
      width: size.width / 1.5,
      height: 700,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        border: Border.all(width: 5, color: AppColors.primary),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildFormSection(),
          _buildImageSection(),
        ],
      ),
    );
  }

  Widget _buildFormSection() {
    return Flexible(
      flex: 4,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: _isForgetPassword
              ? _buildForgetPassword()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildHeader(),
                    if (_isLogin) _buildTabBar(),
                    _buildFormFields(),
                    if (_isLogin) _buildForgotPassword(),
                    const SizedBox(height: 30),
                    _buildAuthButton(),
                    _buildOrLine(),
                    if (_tabController.index == 0) _buildSignupOption()
                  ],
                )),
    );
  }

  Widget _buildForgetPassword() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildHeader(),
        const SizedBox(
          height: 20,
        ),
        W_TextFieldWidget(
          title: "Email Address",
          hint: "alex@email.com",
          icon: AppIcons.mail,
          inputType: TextInputType.emailAddress,
          controller: _adminEmailController,
          isWeb: true,
          isTablet: false,
        ),
        const SizedBox(height: 25),
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.primary, width: 2),
                color: Colors.white),
            alignment: Alignment.center,
            child: Text(
              "Send Reset Link",
              style: AppTextStyles.dynamicStyle(
                  fontSize: 1.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary),
            ),
          ),
        ),
        _buildOrLine(),
        GestureDetector(
          onTap: () => setState(() => _isForgetPassword = !_isForgetPassword),
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.primary, width: 2),
                color: AppColors.primary),
            alignment: Alignment.center,
            child: Text(
              "Login With Existing Account",
              style: AppTextStyles.dynamicStyle(
                  fontSize: 1.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Column(
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
          _isLogin ? "Log into your account" : "Create New Account",
          style: AppTextStyles.dynamicStyle(
            fontSize: 0.9.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textLight,
          ),
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: W_TabBarWidget(
          controller: _tabController, isWeb: true, isTablet: false),
    );
  }

  Widget _buildFormFields() {
    return Column(
      children: _tabController.index == 1
          ? _adminFields()
          : _isLogin
              ? _userLoginFields()
              : _userSignupFields(),
    );
  }

  List<Widget> _adminFields() {
    return [
      W_TextFieldWidget(
        title: "Admin Email Address",
        hint: "alex@email.com",
        icon: AppIcons.mail,
        inputType: TextInputType.emailAddress,
        controller: _adminEmailController,
        isWeb: true,
        isTablet: false,
      ),
      const SizedBox(height: 10),
      W_TextFieldWidget(
        title: "Admin Password",
        inputType: TextInputType.visiblePassword,
        hint: "ABC123",
        icon: AppIcons.password,
        controller: _adminPasswordController,
        isWeb: true,
        isTablet: false,
      ),
    ];
  }

  List<Widget> _userLoginFields() {
    return [
      W_TextFieldWidget(
        title: "Email Address",
        inputType: TextInputType.emailAddress,
        hint: "alex@email.com",
        icon: AppIcons.mail,
        controller: _emailController,
        isWeb: true,
        isTablet: false,
      ),
      const SizedBox(height: 10),
      W_TextFieldWidget(
        title: "Password",
        inputType: TextInputType.visiblePassword,
        hint: "ABC123",
        icon: AppIcons.password,
        controller: _passwordController,
        isWeb: true,
        isTablet: false,
      ),
    ];
  }

  List<Widget> _userSignupFields() {
    return [
      ..._userLoginFields(),
      const SizedBox(height: 10),
      W_TextFieldWidget(
        title: "Confirm Password",
        inputType: TextInputType.visiblePassword,
        hint: "ABC123",
        icon: AppIcons.password,
        controller: _confirmPasswordController,
        isWeb: true,
        isTablet: false,
      ),
    ];
  }

  Widget _buildAuthButton() {
    return _buttonWidget(
      _isLogin ? "Login Now" : "Sign Up Now",
      () => _isLogin
          ? _login(context, _tabController.index == 1 ? "admin" : "user")
          : _register(),
      true,
    );
  }

  Widget _buildSignupOption() {
    return _buttonWidget(
      _isLogin ? "Sign Up Now" : "Login",
      () => setState(() => _isLogin = !_isLogin),
      false,
    );
  }

  Widget _buildImageSection() {
    return Flexible(
      flex: 6,
      child: Container(
        padding: const EdgeInsets.all(70),
        decoration: const BoxDecoration(
          color: Color(0xffF1F3F6),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
        ),
        alignment: Alignment.center,
        child: Image.asset(AppAssets.signIn_image),
      ),
    );
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

  _buildOrLine() => Padding(
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
                      margin: const EdgeInsets.only(right: 20),
                      color: Colors.grey.shade200,
                    ),
                  )
                : const Center()
          ],
        ),
      );

  _buildForgotPassword() => GestureDetector(
        onTap: () => setState(() => _isForgetPassword = !_isForgetPassword),
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(right: 20, top: 12),
          child: Text(
            "Forgot Password",
            textAlign: TextAlign.right,
            style: AppTextStyles.dynamicStyle(
              fontSize: 1.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
        ),
      );
}
