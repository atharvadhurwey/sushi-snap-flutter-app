import 'package:flutter/material.dart';
import 'package:sushi_snap/utils/theme/custom_themes/appbar_theme.dart';
import 'package:sushi_snap/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:sushi_snap/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:sushi_snap/utils/theme/custom_themes/chip_theme.dart';
import 'package:sushi_snap/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:sushi_snap/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:sushi_snap/utils/theme/custom_themes/text_field_theme.dart';
import 'package:sushi_snap/utils/theme/custom_themes/text_theme.dart';

class SAppTheme {
  SAppTheme._();

  // Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: STextTheme.lightTextTheme,
    chipTheme: SChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: SAppBarTheme.lightAppBarTheme,
    checkboxTheme: SCheckBoxTheme.lightCheckboxTheme,
    bottomSheetTheme: SBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: SElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: SOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: STextFieldTheme.lightInputDecorationTheme,
  );

  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: STextTheme.darkTextTheme,
    chipTheme: SChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: SAppBarTheme.darkAppBarTheme,
    checkboxTheme: SCheckBoxTheme.darkCheckboxTheme,
    bottomSheetTheme: SBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: SElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: SOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: STextFieldTheme.darkInputDecorationTheme,
  );
}
