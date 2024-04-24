import 'package:flutter/material.dart';
import 'package:onechat/themes/dart_mode.dart';
import 'package:onechat/themes/ligth_mode.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeData themeData=ligthMode;
  ThemeData get theme=>themeData;
  bool get isDarkMode => themeData==darkMode;

  set theme(ThemeData theme){
    themeData=theme;
    notifyListeners();
  }
  void toggleTheme(){
    if(themeData==ligthMode){
      theme=darkMode;
    }
    else{
      theme=ligthMode;
    }
  }
}