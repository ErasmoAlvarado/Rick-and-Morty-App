import 'package:flutter/material.dart';

class MyTheme {
  // dark theme

  static final darkTheme = ThemeData(
      colorScheme: const ColorScheme.dark(),
      //appbar theme
      appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        
      )));

  //white theme

  static final lightTheme = ThemeData(
      colorScheme: const ColorScheme.light(),
      
    
      //appbar theme
      appBarTheme: const AppBarTheme(
      
          iconTheme: IconThemeData(color: Colors.black),
          
          titleTextStyle:
              TextStyle(fontWeight: FontWeight.bold)));
}
