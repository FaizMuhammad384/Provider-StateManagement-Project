

import 'package:flutter/material.dart';

class WishListProvider extends ChangeNotifier{

  /// empty list
  final List _wishList = [];

  List get wishList => _wishList;

  /// add item into wishList
  void addItem(String item){
    _wishList.add(item);
    notifyListeners();
  }

  /// remove item into wishList
  void removeItem(String item){
    _wishList.remove(item);
    notifyListeners();
  }

}