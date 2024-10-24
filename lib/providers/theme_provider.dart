

import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{

  /// set by default theme data to light theme
  ThemeData _themeData = ThemeData.light();

  /// get theme data
  ThemeData get themeData => _themeData;


  /// set theme toggle theme functionality....
   void toggleTheme(){
     final isDarkMode = _themeData == ThemeData.light();
     if(isDarkMode){
       _themeData = ThemeData.dark();
     } else{
       _themeData = ThemeData.light();
     }
     notifyListeners();
   }

}