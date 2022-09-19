import 'package:flutter/material.dart';
import 'dart:math';

import '../calendar/CalendarPage.dart';

class RandomProvider extends ChangeNotifier {
  final String _firstNum = 'Nhập số đầu';
  String get firstNum => _firstNum;

  final String _lastNum = 'Nhập số cuối';
  String get lastNum => _lastNum;

  String _ramdomNum = '';
  String get randomNum => _ramdomNum;

  String errorText = 'Số quá bự vui lòng nhập số bé hơn';

  void clicked(int min, int max) {
    if (min < 0 || max < 0) {
      _ramdomNum = 'Không chọn số âm';
    } else if (max - min < 0) {
      _ramdomNum = 'Số đầu bự hơn số cuối';
    } else if (min > 100000 || max > 100000) {
      _ramdomNum = errorText;
    } else {
      _ramdomNum = ((min + Random().nextInt((max + 1) - min))).toString();
    }

    notifyListeners();
  }

  go(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: ((context) => const CalendarPage())));
    notifyListeners();
  }
}
