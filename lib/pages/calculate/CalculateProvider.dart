import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalculateProvider with ChangeNotifier {
  final String _a = 'Chọn ngày quen';
  String get a => _a;

  final DateTime _date1 = DateTime(2017, 12, 9);
  DateTime get date1 => _date1;
  final DateTime _date2 = DateTime.now();
  DateTime get date2 => _date2;

  String date = '';

  int dayBeen = 0;

  dateTime(context) async {
    DateTime? pickdate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (pickdate != null) {
      print(pickdate);
      date = DateFormat('dd-MM-yyyy').format(pickdate);
      int day = date2.difference(pickdate).inDays;
      dayBeen = day;
      DateTime test = DateTime.parse("2022-09-15 00:00:00.000");
      print("Tét: ${test}");
    } else
      print('error');

    notifyListeners();
  }
}
