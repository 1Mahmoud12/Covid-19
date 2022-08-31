import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_color_generator/material_color_generator.dart';

import 'color.dart';

ThemeData lightTheme = ThemeData(
    primarySwatch: generateMaterialColor(color: defaultColor),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.orangeAccent),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        systemOverlayStyle:  SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: Colors.black)),
    textTheme: const TextTheme(
        bodyText1: TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black)),
    //fontFamily: 'jannahFont'
);

ThemeData darkTheme = ThemeData(
    primarySwatch: defaultColor as MaterialColor,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor:defaultColor),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey[900],
      elevation: 50.0,
      unselectedItemColor: Colors.white,
      selectedItemColor: defaultColor,
      type:
          BottomNavigationBarType.fixed, //مهم جداااااااااااااااااااااااااااااا
    ),
    scaffoldBackgroundColor: Colors.black12,
    appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: Colors.black12,
        elevation: 0.0,
        titleTextStyle:  TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: Colors.white)),
    textTheme: const TextTheme(
        bodyText1:  TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white)),
    //fontFamily: 'jannahFont'
);
