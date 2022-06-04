
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

const Color primaryColor = Color(0xfff9a727);
const Color errorColor = Color(0xffb3261E);
BorderRadius borderRadius = BorderRadius.circular(30.h);
const Color blackColor = Color(0xff3f3d56);




ThemeData theme = ThemeData(
  primaryColorLight: primaryColor,
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(color: blackColor),
    centerTitle: true,
  ),
  primaryColor: primaryColor,

  //Input Decoration
  inputDecorationTheme: InputDecorationTheme(
    focusColor: primaryColor,
    errorStyle: const TextStyle(
      color: errorColor,
    ),
    isDense: true,
    suffixIconColor: MaterialStateColor.resolveWith((states) {
      if (states.contains(MaterialState.focused) &&
          !states.contains(MaterialState.error)) {
        return blackColor;
      }
      if (states.contains(MaterialState.error)) {
        return errorColor;
      }
      return Colors.black;
    }),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: primaryColor),
      borderRadius: borderRadius,
    ),
    border: OutlineInputBorder(
      borderRadius: borderRadius,
    ),
  ),

  //ElevatedButtonDecoration
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: primaryColor,
      fixedSize: Size(100.w, 5.h),
    ),
  ),
  // Scaffold
  scaffoldBackgroundColor: Colors.white

);

//  todo : Put the libels on focus of the color primary