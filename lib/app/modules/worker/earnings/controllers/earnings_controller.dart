import 'package:get/get.dart';

class EarningsController extends GetxController {
  final selectedFilter = 'Week'.obs;

  void setFilter(String filter) {
    selectedFilter.value = filter;
  }

  final transactions = [
    {
      'title': 'Pipe Leak Repair',
      'client': 'Jennifer M.',
      'time': 'Today â€¢ 11:45 AM',
      'amount': '+\$75',
      'status': 'PAID',
    },
    {
      'title': 'Faucet Fix',
      'client': 'Maria S.',
      'time': 'Today â€¢ 3:20 PM',
      'amount': '+\$55',
      'status': 'PAID',
    },
    {
      'title': 'Drain Cleaning',
      'client': 'Robert C.',
      'time': 'Yesterday â€¢ 9:00 AM',
      'amount': '+\$90',
      'status': 'PAID',
    },
    {
      'title': 'Toilet Repair',
      'client': 'Alice T.',
      'time': 'Apr 5 â€¢ 2:00 PM',
      'amount': '+\$60',
      'status': 'PAID',
    },
    {
      'title': 'Water Heater',
      'client': 'James L.',
      'time': 'Apr 4 â€¢ 10:30 AM',
      'amount': '+\$145',
      'status': 'PAID',
    },
  ].obs;
}

