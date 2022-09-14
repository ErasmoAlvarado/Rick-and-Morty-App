import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wikisanchez/config/theme.dart';
import 'package:wikisanchez/view/homePage/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        themeMode: ThemeMode.system,
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        home: HomePage(),
      );
    },);
  }
}
