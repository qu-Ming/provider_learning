import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculateProvider with ChangeNotifier {
  String _a = 'aaaaaaaaa';
  String get a => _a;

  DateTime _date1 = DateTime(2017, 12, 9);
  DateTime get date1 => _date1;
  DateTime _date2 = DateTime.now();
  DateTime get date2 => _date2;

  dateTime() {
    int hours = date2.difference(date1).inHours;
    int day = date2.difference(date1).inDays;

    _a = hours.toString();

    print("$day and $hours");

    notifyListeners();
  }

  onTap(context) async {
    DateTime? pcikdate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2017),
        lastDate: DateTime(2024));
    notifyListeners();
  }
}
