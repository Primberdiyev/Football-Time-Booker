import 'package:flutter/material.dart';

abstract class AppThemeHeadingTextStyles {
  const AppThemeHeadingTextStyles();

  final String fontFamily = 'Urbanist';

  TextStyle get head1;

  TextStyle get head2;

  TextStyle get head3;

  TextStyle get head4;

  TextStyle get head5;

  TextStyle get head6;
}
