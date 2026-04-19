import 'package:get/get.dart';
import '../../../core/constants/static/app_strings.dart';
import '../../../core/constants/static/app_images.dart';

class ServicesController extends GetxController {
  final services = <Map<String, dynamic>>[
    {'title': AppStrings.repairMaintenance.tr, 'image': AppImages.placeholderService},
    {'title': AppStrings.cleaning.tr, 'image': AppImages.placeholderService},
    {'title': AppStrings.installation.tr, 'image': AppImages.placeholderService},
    {'title': AppStrings.homeImprovement.tr, 'image': AppImages.placeholderService},
    {'title': AppStrings.movingShifting.tr, 'image': AppImages.placeholderService},
    {'title': AppStrings.gardenCleaning.tr, 'image': AppImages.placeholderService},
  ].obs;
}
