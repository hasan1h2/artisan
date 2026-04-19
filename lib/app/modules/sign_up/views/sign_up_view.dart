import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/components/custom_button.dart';
import '../../../core/components/custom_social_button.dart';
import '../../../core/components/custom_text_field.dart';
import '../../../core/constants/static/app_colors.dart';
import '../../../core/constants/static/app_images.dart';
import '../../../core/constants/static/app_strings.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

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
              _buildSignUpForm(),
              SizedBox(height: 32.h),
              _buildOrDivider(),
              SizedBox(height: 24.h),
              _buildSocialLogins(),
              SizedBox(height: 40.h),
              _buildLoginPrompt(),
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
          AppStrings.registerAccount.tr,
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

  Widget _buildSignUpForm() {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          CustomTextField(
            labelText: AppStrings.fullName.tr,
            hintText: 'Your Name',
            controller: controller.nameController,
            validator: (value) => value == null || value.isEmpty ? 'Please enter your name' : null,
          ),
          SizedBox(height: 16.h),
          CustomTextField(
            labelText: AppStrings.email.tr,
            hintText: 'brooklynsim@gm |',
            controller: controller.emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => value == null || value.isEmpty ? 'Please enter your email' : null,
          ),
          SizedBox(height: 16.h),
          CustomTextField(
            labelText: AppStrings.number.tr,
            hintText: '+1 (500) 000-0000',
            controller: controller.phoneController,
            keyboardType: TextInputType.phone,
            validator: (value) => value == null || value.isEmpty ? 'Please enter your phone number' : null,
          ),
          SizedBox(height: 16.h),
          Obx(() => CustomTextField(
            labelText: AppStrings.password.tr,
            hintText: '••••••••',
            controller: controller.passwordController,
            obscureText: controller.obscurePassword.value,
            suffixIcon: IconButton(
              icon: SvgPicture.asset(
                controller.obscurePassword.value ? AppImages.eyeHideIcon : AppImages.eyeShowIcon,
                width: 24.w,
                height: 24.w,
                colorFilter: const ColorFilter.mode(AppColors.greyText, BlendMode.srcIn),
              ),
              onPressed: controller.togglePasswordVisibility,
            ),
            validator: (value) => value == null || value.isEmpty ? 'Please enter your password' : null,
          )),
          SizedBox(height: 16.h),
          Obx(() => CustomTextField(
            labelText: AppStrings.confirmPassword.tr,
            hintText: '••••••••',
            controller: controller.confirmPasswordController,
            obscureText: controller.obscureConfirmPassword.value,
            suffixIcon: IconButton(
              icon: SvgPicture.asset(
                controller.obscureConfirmPassword.value ? AppImages.eyeHideIcon : AppImages.eyeShowIcon,
                width: 24.w,
                height: 24.w,
                colorFilter: const ColorFilter.mode(AppColors.greyText, BlendMode.srcIn),
              ),
              onPressed: controller.toggleConfirmPasswordVisibility,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) return 'Please confirm your password';
              if (value != controller.passwordController.text) return 'Passwords do not match';
              return null;
            },
          )),
          SizedBox(height: 16.h),
          Row(
            children: [
               Obx(() => Checkbox(
                value: controller.agreeToTerms.value,
                onChanged: controller.toggleTermsAgreement,
                activeColor: AppColors.checkboxActive,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                side: const BorderSide(color: AppColors.border),
              )),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    text: 'Agree with ',
                    style: GoogleFonts.poppins(
                      color: AppColors.textColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: 'terms',
                        style: GoogleFonts.poppins(
                          color: AppColors.textColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: ' and ',
                        style: GoogleFonts.poppins(
                          color: AppColors.textColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'privacy',
                        style: GoogleFonts.poppins(
                          color: AppColors.textColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          CustomButton(
            text: AppStrings.signUp.tr,
            onPressed: controller.signUp,
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

  Widget _buildLoginPrompt() {
    return Center(
      child: RichText(
        text: TextSpan(
          text: '${AppStrings.alreadyHaveAccount.tr} ',
          style: GoogleFonts.poppins(
            color: AppColors.primary,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          children: [
            TextSpan(
              text: AppStrings.signIn.tr,
              style: GoogleFonts.poppins(
                color: AppColors.primary,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
              recognizer: TapGestureRecognizer()..onTap = controller.navigateToLogin,
            ),
          ],
        ),
      ),
    );
  }
}
