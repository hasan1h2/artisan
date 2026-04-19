import 'package:get/get.dart';

class IncomingRequestsController extends GetxController {
  final requests = [
    {
      'clientName': 'Jennifer Martinez',
      'serviceTitle': 'Pipe Leak Repair',
      'address': '48 Elm Street, Downtown',
      'distance': '1.2 km',
      'time': '5 min',
      'price': '\$75',
      'tag': 'URGENT',
    },
    {
      'clientName': 'David Wilson',
      'serviceTitle': 'Bathroom Faucet Fix',
      'address': '219 Park Ave, Midtown',
      'distance': '3.9 km',
      'time': '15 min',
      'price': '\$55',
      'tag': 'NORMAL',
    },
  ].obs;

  void acceptRequest(int index) {
    // Logic to accept
  }

  void declineRequest(int index) {
    // Logic to decline
  }
}
