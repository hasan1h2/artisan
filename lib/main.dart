import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

import './app/core/constants/static/app_strings.dart';
import './app/core/routes/app_pages.dart';
import './app/core/routes/app_routes.dart';
import './app/core/theme/app_theme.dart';
import './app/core/global_controllers/role_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844), // Base typical iPhone size matching Figma
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        Get.put(RoleController(), permanent: true);
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Fixgo Artisan Platform',
          theme: AppTheme.lightTheme,
          translations: AppStrings(), // Applying generated localized strings
          locale: const Locale('en', 'US'),
          fallbackLocale: const Locale('en', 'US'),
          initialRoute: Routes.SPLASH,
          getPages: AppPages.routes,
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: MaxWidthBox(
              maxWidth: 1920,
              child: BouncingScrollWrapper.builder(context, child!),
            ),
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          ),
        );
      },
    );
  }
}
