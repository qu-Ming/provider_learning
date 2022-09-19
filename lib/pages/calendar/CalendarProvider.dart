import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CalendarProvider with ChangeNotifier {
  // final String _a = 'Chọn ngày quen';
  // String get a => _a;

  // final DateTime _dateNow = DateTime.now();
  // DateTime get dateNow => _dateNow;

  // String date = '';

  // int dayBeen = 0;

  // Future dateTime(context) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   DateTime? pickdate = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2030),
  //   );

  //   if (pickdate != null) {
  //     date = prefs.getString('KEY_DATE') ??
  //         DateFormat('dd-MM-yyyy').format(pickdate);

  //     prefs.setString('KEY_DATE', date);

  //     int day = dateNow.difference(pickdate).inDays;
  //     dayBeen = day;
  //   } else
  //     print('error');

  //   notifyListeners();
  // }

  final String _titleDate = 'Chọn ngày quen';
  String get titleDate => _titleDate;

  String familiarDate = '';
  String dayBeen = '';

  Future<void> openCalendar(context) async {
    DateTime? pickdate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );

    if (pickdate != null) {
      final prefs = await SharedPreferences.getInstance();
      familiarDate = prefs.getString('KEY_DATE') ??
          DateFormat('dd-MM-yyyy').format(pickdate);

      prefs.setString('KEY_DATE', familiarDate);
    } else {
      print(context);
    }

    // Future saveDate() async {
    //   final prefs = await SharedPreferences.getInstance();
    //   familiarDate = prefs.getString('KEY_DATE') ??
    //       DateFormat('dd-MM-yyyy').format(pickdate!);

    //   prefs.setString('KEY_DATE', familiarDate);
    // }

    notifyListeners();
  }

  // Future readDate() async {
  //   final prefs = await SharedPreferences.getInstance();

  //   familiarDate = prefs.getString('DATE_KEY') ?? 0 as String;
  // }
}
