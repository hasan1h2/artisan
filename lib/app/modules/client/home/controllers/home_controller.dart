import 'package:get/get.dart';
import '../../../../core/constants/static/app_images.dart';

class HomeController extends GetxController {
  final popularServices = <Map<String, dynamic>>[
    {
      'title': 'Pipe Leak Repair',
      'image': AppImages.placeholderService,
      'rating': 4.8,
      'reviews': 89,
      'priceRange': '\$40-\$80',
    },
    {
      'title': 'Toilet Repair',
      'image': AppImages.placeholderService,
      'rating': 4.8,
      'reviews': 69,
      'priceRange': '\$35-\$65',
    },
    {
      'title': 'Deep House Cleaning',
      'image': AppImages.placeholderService,
      'rating': 4.8,
      'reviews': 89,
      'priceRange': '\$60-\$120',
    },
    {
      'title': 'Electrical Wiring',
      'image': AppImages.placeholderService,
      'rating': 4.8,
      'reviews': 89,
      'priceRange': '\$80-\$200',
    },
  ].obs;

  final recommendedArtisans = <Map<String, dynamic>>[
    {
      'name': 'Marcus Johnson',
      'role': 'Plumber',
      'avatar': AppImages.placeholderAvatar,
      'isVerified': true,
      'rating': 4.9,
      'reviews': 127,
      'pricePerHour': '\$35/hr',
      'distanceOrTime': '1.2 km',
    },
    {
      'name': 'Sarah Williams',
      'role': 'Cleaner',
      'avatar': AppImages.placeholderAvatar,
      'isVerified': true,
      'rating': 4.8,
      'reviews': 89,
      'pricePerHour': '\$28/hr',
      'distanceOrTime': '2.1 km',
    },
    {
      'name': 'Daniel Carter',
      'role': 'Electrician',
      'avatar': AppImages.placeholderAvatar,
      'isVerified': true,
      'rating': 4.7,
      'reviews': 203,
      'pricePerHour': '\$45/hr',
      'distanceOrTime': '3.4 km',
    },
  ].obs;
}
