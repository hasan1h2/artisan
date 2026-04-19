import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/components/custom_button.dart';
import '../../../../core/components/custom_social_button.dart';
import '../../../../core/components/custom_text_field.dart';
import '../../../../core/constants/static/app_colors.dart';
import '../../../../core/constants/static/app_images.dart';
import '../../../../core/constants/static/app_strings.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: 40.h),
              _buildLoginForm(),
              SizedBox(height: 32.h),
              _buildOrDivider(),
              SizedBox(height: 24.h),
              _buildSocialLogins(),
              SizedBox(height: 40.h),
              _buildSignUpPrompt(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.welcomeBack.tr,
          style: GoogleFonts.poppins(
            color: AppColors.primary,
            fontSize: 28.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          AppStrings.signInSub.tr,
          style: GoogleFonts.poppins(
            color: AppColors.greyText,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          CustomTextField(
            labelText: AppStrings.email.tr,
            hintText: 'brooklynsim@gm |',
            controller: controller.emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          SizedBox(height: 16.h),
          Obx(() => CustomTextField(
            labelText: AppStrings.password.tr,
            hintText: '••••••••',
            controller: controller.passwordController,
            obscureText: controller.obscurePassword.value,
            suffixIcon: IconButton(
              icon: SvgPicture.asset(
                controller.obscurePassword.value 
                  ? AppImages.eyeHideIcon 
                  : AppImages.eyeShowIcon,
                width: 24.w,
                height: 24.w,
                colorFilter: const ColorFilter.mode(AppColors.greyText, BlendMode.srcIn),
              ),
              onPressed: controller.togglePasswordVisibility,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          )),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                   Obx(() => Checkbox(
                    value: controller.rememberMe.value,
                    onChanged: controller.toggleRememberMe,
                    activeColor: AppColors.checkboxActive,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    side: const BorderSide(color: AppColors.border),
                  )),
                  Text(
                    AppStrings.rememberMe.tr,
                    style: GoogleFonts.poppins(
                      color: AppColors.textColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () => controller.navigateForgotPassword(),
                child: Text(
                  AppStrings.forgotPassword.tr,
                  style: GoogleFonts.poppins(
                    color: AppColors.textColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          CustomButton(
            text: AppStrings.signIn.tr,
            onPressed: controller.signIn,
          ),
        ],
      ),
    );
  }

  Widget _buildOrDivider() {
    return Center(
      child: Text(
        AppStrings.or.tr,
        style: GoogleFonts.poppins(
          color: AppColors.primary,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildSocialLogins() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomSocialButton(
          iconPath: AppImages.googleIcon,
          onPressed: () => controller.onSocialLogin('Google'),
        ),
        SizedBox(width: 20.w),
        CustomSocialButton(
          iconPath: AppImages.appleIcon,
          onPressed: () => controller.onSocialLogin('Apple'),
        ),
      ],
    );
  }

  Widget _buildSignUpPrompt() {
    return Center(
      child: RichText(
        text: TextSpan(
          text: '${AppStrings.dontHaveAccount.tr} ',
          style: GoogleFonts.poppins(
            color: AppColors.primary,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          children: [
            TextSpan(
              text: AppStrings.signUp.tr,
              style: GoogleFonts.poppins(
                color: AppColors.primary,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
              recognizer: TapGestureRecognizer()..onTap = controller.navigateToSignUp,
            ),
          ],
        ),
      ),
    );
  }
}
