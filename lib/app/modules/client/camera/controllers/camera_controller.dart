import 'package:get/get.dart';
import '../../booking/controllers/booking_controller.dart';
import '../../../../core/routes/app_routes.dart';

class CameraController extends GetxController {
  final isCaptured = false.obs;
  
  void capturePhoto() {
    // In a real application, implement the camera package capture logic here
    isCaptured.value = true;
  }

  void retakePhoto() {
    isCaptured.value = false;
  }

  void proceedToNext() {
    try {
      final bookingController = Get.find<BookingController>();
      // Simulate saving an image path
      bookingController.capturedImagePath.value = 'dummy_path.jpg';
      // Now naturally proceed to Confirm Booking
      Get.toNamed(Routes.CONFIRM_BOOKING);
    } catch (e) {
      Get.snackbar('Error', 'Booking session not found.');
    }
  }
}
