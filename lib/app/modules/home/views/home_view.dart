import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/static/app_colors.dart';
import '../../../core/constants/static/app_images.dart';
import '../../../core/constants/static/app_strings.dart';
import '../../../core/components/service_category_card.dart';
import '../../../core/components/service_item_card.dart';
import '../../../core/components/artisan_profile_card.dart';
import '../controllers/home_controller.dart';

import '../../../core/routes/app_routes.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            Transform.translate(
              offset: Offset(0, -24.h),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24.h),
                      _buildForYouSection(),
                      SizedBox(height: 24.h),
                      _buildPopularServicesSection(),
                      SizedBox(height: 24.h),
                      _buildRecommendedArtisansSection(),
                      SizedBox(height: 24.h),
                      _buildPromoBanner(),
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      color: AppColors.primary,
      padding: EdgeInsets.only(top: 60.h, left: 24.w, right: 24.w, bottom: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on, color: AppColors.white, size: 24.w),
                  SizedBox(width: 8.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'San Francisco',
                            style: GoogleFonts.poppins(
                              color: AppColors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down, color: AppColors.white, size: 20.w),
                        ],
                      ),
                      Text(
                        '75 Wellington Street, ON K1A 0A2',
                        style: GoogleFonts.poppins(
                          color: AppColors.white.withAlpha(200),
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Icon(Icons.notifications_none, color: AppColors.white, size: 24.w),
            ],
          ),
          SizedBox(height: 24.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: AppColors.greyText, size: 20.w),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    AppStrings.searchService.tr,
                    style: GoogleFonts.poppins(
                      color: AppColors.greyText,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            AppStrings.letLocalExperts.tr,
            style: GoogleFonts.poppins(
              color: AppColors.white,
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),
          Text(
            AppStrings.you.tr,
            style: GoogleFonts.poppins(
              color: AppColors.statusCompletedText,
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForYouSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.forYou.tr,
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textColor,
              ),
            ),
            Icon(Icons.arrow_forward, color: AppColors.textColor, size: 20.w),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: ServiceCategoryCard(
                title: AppStrings.repairMaintenance.tr,
                imagePath: AppImages.placeholderService,
                onTap: () {},
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: ServiceCategoryCard(
                title: AppStrings.cleaning.tr,
                imagePath: AppImages.placeholderService,
                onTap: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPopularServicesSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.popularServices.tr,
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textColor,
              ),
            ),
            Text(
              AppStrings.seeAll.tr,
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Obx(() {
          final items = controller.popularServices.take(4).toList();
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 0.8,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final service = items[index];
              return ServiceItemCard(
                title: service['title'],
                imagePath: service['image'],
                rating: service['rating'],
                reviews: service['reviews'],
                priceRange: service['priceRange'],
                onTap: () {
                  Get.toNamed(Routes.SERVICE_DETAILS);
                },
              );
            },
          );
        }),
      ],
    );
  }

  Widget _buildRecommendedArtisansSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.recommendedArtisans.tr,
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textColor,
              ),
            ),
            Text(
              AppStrings.seeAll.tr,
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Obx(() => ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.recommendedArtisans.length,
          itemBuilder: (context, index) {
            final artisan = controller.recommendedArtisans[index];
            return ArtisanProfileCard(
              name: artisan['name'],
              role: artisan['role'],
              avatarPath: artisan['avatar'],
              isVerified: artisan['isVerified'],
              rating: artisan['rating'],
              reviews: artisan['reviews'],
              pricePerHour: artisan['pricePerHour'],
              distanceOrTime: artisan['distanceOrTime'],
              onTap: () {},
            );
          },
        )),
      ],
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.primary.withAlpha(15),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.primary.withAlpha(50)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.promoTitle.tr,
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  AppStrings.promoCode.tr,
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            ),
            child: Text(
              AppStrings.claim.tr,
              style: GoogleFonts.poppins(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
