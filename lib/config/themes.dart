// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:bmi_cal_new/config/colors.dart';
import 'package:flutter/material.dart';

var lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.light(
    surface: LBgColor,
    primary: LPrimaryColor,
    onSurface: LFontColor,
    primaryContainer: LDivColor,
    onPrimaryContainer: LFontColor,
    onSecondaryContainer: LLabelColor,
  ),
);
var darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
    surface: DBgColor,
    primary: DPrimaryColor,
    onSurface: DFontColor,
    primaryContainer: DDivColor,
    onPrimaryContainer: DFontColor,
    onSecondaryContainer: DLabelColor,
  ),
);
