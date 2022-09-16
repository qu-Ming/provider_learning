import 'package:flutter/cupertino.dart';

class CalculateProvider with ChangeNotifier {
  String _a = 'aaaaaaaaa';
  String get a => _a;

  dateTime() {
    DateTime date1 = DateTime(2017, 12, 9);
    DateTime date2 = DateTime.now();

    int hours = date2.difference(date1).inHours;
    int day = date2.difference(date1).inDays;

    _a = hours.toString();

    print("$day and $hours");

    notifyListeners();
  }
}
