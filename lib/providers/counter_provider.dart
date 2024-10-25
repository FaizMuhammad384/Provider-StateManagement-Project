
import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier{


  int _totalCount = 0;

  /// get total count
  int get count => _totalCount;


  /// increment event or function
  void increment() {
    _totalCount++;
    notifyListeners();
  }


  /// decrement event or function
  void decrement() {
    _totalCount--;
    notifyListeners();
  }

}