import 'package:flutter/material.dart';
import 'package:medicar/app/shared/utils/constants_fonts.dart';

abstract class MedicarTheme {
  // BACKGORUND COLOR
  static const Color backgroundColor = Color(0xFFFDFDFD);

  // PRIMARY COLOR
  static const Color primaryColor = Colors.black;

  // GREEN COLOR CURVE
  static const Color greenColor = Color(0xFF49B4BB);

  // The lowest the suffix the darkest
  static const Color secondaryColor1 = Color(0XFF585858);
  //
  static const Color secondaryColor2 = Color(0XFF757575);
  //
  static const Color secondaryColor3 = Color(0XFFC4C4C4);
  //
  static Color splashColorWhite = Color(0xFFF5F5F5).withOpacity(0.3);
  //
  static Color splashColorGreen = Color(0xFF00BC8E).withOpacity(0.3);

  // APPS FONTS
  static const TextStyle primaryFont = TextStyle(
    fontFamily: ConstantsFonts.MontserratRegular,
    color: MedicarTheme.primaryColor,
    letterSpacing: 0.4,
    decoration: TextDecoration.none,
  );

  static const TextStyle secondaryFont1 = TextStyle(
    fontFamily: ConstantsFonts.MontserratSemiBold,
    color: MedicarTheme.primaryColor,
    letterSpacing: 0.4,
    decoration: TextDecoration.none,
  );

  static const TextStyle secondaryFont2 = TextStyle(
    fontFamily: ConstantsFonts.MontserratSemiBold,
    color: MedicarTheme.primaryColor,
    letterSpacing: 0.4,
    decoration: TextDecoration.none,
  );

  static const TextStyle secondaryFont3 = TextStyle(
    fontFamily: ConstantsFonts.MontserratBold,
    color: MedicarTheme.primaryColor,
    letterSpacing: 0.4,
    decoration: TextDecoration.none,
  );
}

ThemeData theme = ThemeData.light().copyWith(
  accentColor: Color(0XFFE4E4E4),
  primaryColor: Colors.black,
  primaryColorLight: Color(0XFFFAFAFA),
  dialogBackgroundColor: Color(0XFFEDEDED),
  splashColor: Colors.grey[200],
  hintColor: Color(0XFFA2A2A2),
  buttonTheme: ButtonThemeData(
    disabledColor: Colors.grey[400],
    buttonColor: Colors.black,
  ),

  textTheme: TextTheme(
    bodyText1: TextStyle(
        fontFamily: ConstantsFonts.MontserratRegular, letterSpacing: 0.1),
    bodyText2: TextStyle(
        fontFamily: ConstantsFonts.MontserratRegular, letterSpacing: 0.1),
    headline1: TextStyle(
      fontFamily: 'Helvetica',
      letterSpacing: 0.1,
      // color: Color(0XFF4E4E4E),
    ),
    subtitle1: TextStyle(
        fontFamily: ConstantsFonts.MontserratRegular, letterSpacing: 0.1),
    subtitle2: TextStyle(
        fontFamily: ConstantsFonts.MontserratRegular, letterSpacing: 0.1),
    button: TextStyle(
        fontFamily: ConstantsFonts.MontserratRegular, letterSpacing: 0.1),
  ),
);