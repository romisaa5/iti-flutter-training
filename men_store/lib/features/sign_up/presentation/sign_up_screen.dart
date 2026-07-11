import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:men_store/core/helpers/app_navigator.dart';
import 'package:men_store/core/helpers/app_validators.dart';
import 'package:men_store/core/helpers/extensions.dart';
import 'package:men_store/core/theme/app_colors/light_app_colors.dart';
import 'package:men_store/core/theme/app_texts/app_text_styles.dart';
import 'package:men_store/core/widgets/app_button.dart';
import 'package:men_store/core/widgets/app_input.dart';
import 'package:men_store/core/widgets/auth_rich_text.dart';
import 'package:men_store/features/login/presentation/screens/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _userNameController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _fullNameController.dispose();
    _userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                35.h.ph,
                Text(
                  'Create an account',
                  style: AppTextStyles.font32SemiBold.copyWith(
                    color: LightAppColors.grey900,
                  ),
                ),
                5.h.ph,
                Text(
                  'Let’s create your account.',
                  style: AppTextStyles.font16Regular.copyWith(
                    color: LightAppColors.grey700,
                  ),
                ),
                30.h.ph,
                AppInput(
                  hintText: 'Enter your full name',
                  controller: _fullNameController,
                  validator: (value) => AppValidators.name(value),
                  labelText: 'Full Name',
                  keyboardType: TextInputType.name,
                ),
                20.h.ph,
                AppInput(
                  hintText: 'Enter your user name',
                  controller: _userNameController,
                  validator: (value) => AppValidators.name(value),
                  labelText: 'User Name',
                ),
                20.h.ph,
                AppInput(
                  hintText: 'Enter your password',
                  controller: _passwordController,
                  validator: (value) => AppValidators.password(value),
                  labelText: 'Password',
                  isObscureText: true,
                ),
                20.h.ph,
                AppInput(
                  controller: _confirmPasswordController,
                  hintText: 'Confirm your password',
                  validator: (value) => AppValidators.confirmPassword(
                    value,
                    _passwordController.text,
                  ),
                  labelText: 'Confirm Password',
                  isObscureText: true,
                ),
                55.h.ph,
                AppButton(
                  text: 'Create Account',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                ),
                100.h.ph,
                Align(
                  alignment: Alignment.center,
                  child: AuthRichText(
                    title: "Already have an account? ",
                    actionText: "Sign In",
                    onTap: () {
                      AppNavigator.push(LoginScreen());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
