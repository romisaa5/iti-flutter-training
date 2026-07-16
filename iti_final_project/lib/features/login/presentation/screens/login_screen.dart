import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iti_final_project/core/di/service_locater.dart';
import 'package:iti_final_project/core/helpers/app_validators.dart';
import 'package:iti_final_project/core/helpers/extensions.dart';
import 'package:iti_final_project/core/network/token_storage.dart';
import 'package:iti_final_project/core/theme/app_colors/light_app_colors.dart';
import 'package:iti_final_project/core/theme/app_texts/app_text_styles.dart';
import 'package:iti_final_project/core/widgets/app_button.dart';
import 'package:iti_final_project/core/widgets/app_input.dart';
import 'package:iti_final_project/core/widgets/auth_rich_text.dart';
import 'package:iti_final_project/features/login/presentation/cubit/login_cubit.dart';
import 'package:iti_final_project/features/login/presentation/cubit/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginCubit>(),
      child: Scaffold(
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              TokenStorage.saveToken(state.response.accessToken ?? "");
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Login Successfully')),
              );
              // AppNavigator.pushAndRemoveUntil(const CustomBottomNav());
            }

            if (state is LoginError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return Form(
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
                        'Login to your account',
                        style: AppTextStyles.font32SemiBold.copyWith(
                          color: LightAppColors.grey900,
                        ),
                      ),
                      5.h.ph,
                      Text(
                        'It’s great to see you again.',
                        style: AppTextStyles.font16Regular.copyWith(
                          color: LightAppColors.grey700,
                        ),
                      ),
                      30.h.ph,
                      AppInput(
                        hintText: 'Enter your email address',
                        controller: _emailController,
                        validator: (value) => AppValidators.email(value),
                        labelText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      20.h.ph,
                      AppInput(
                        hintText: 'Enter your password',
                        controller: _passwordController,
                        validator: (value) => AppValidators.password(value),
                        labelText: 'Password',
                        isObscureText: true,
                      ),
                      55.h.ph,
                      AppButton(
                        text: 'Sign In',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<LoginCubit>().login(
                              username: _emailController.text.trim(),
                              password: _passwordController.text.trim(),
                            );
                          }
                        },
                      ),
                      300.h.ph,
                      Align(
                        alignment: Alignment.center,
                        child: AuthRichText(
                          title: "Don't have an account ?  ",
                          actionText: "Sign Up",
                          onTap: () {
                            // AppNavigator.push(SignUpScreen());
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
