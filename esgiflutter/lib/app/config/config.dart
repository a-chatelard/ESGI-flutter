
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

const Color primaryColor = Color(0xff6750A4);
const Color errorColor = Color(0xffb3261E);
BorderRadius borderRadius = BorderRadius.circular(30.h);



ThemeData theme = ThemeData(
  primaryColorLight: primaryColor,
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.transparent,
    titleTextStyle: TextStyle(color: primaryColor),
    centerTitle: true,
  ),
  primaryColor: primaryColor,

  //Input Decoration
  inputDecorationTheme: InputDecorationTheme(
    errorStyle: const TextStyle(
      color: errorColor,
    ),
    isDense: true,
    suffixIconColor: MaterialStateColor.resolveWith((states) {
      if (states.contains(MaterialState.focused) &&
          !states.contains(MaterialState.error)) {
        return primaryColor;
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
      onPrimary: Colors.white,
      primary: primaryColor,
      fixedSize: Size(100.w, 5.h),
    ),
  ),

);