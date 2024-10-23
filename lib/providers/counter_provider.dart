


import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier{


  int _totalCount = 0;

  /// get total count
  int get count => _totalCount;


  /// increment counter
  void increment(){
    _totalCount++;
    notifyListeners();
  }


  /// decrement counter
  void decrement(){
    _totalCount--;
    notifyListeners();
  }

}