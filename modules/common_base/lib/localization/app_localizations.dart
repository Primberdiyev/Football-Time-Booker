import 'package:common_base/localization/generated/localization.dart';
import 'package:flutter/material.dart';

class AppLocalizations {
  const AppLocalizations._();

  static final List<LocalizationsDelegate> delegates = [
    ...L10n.localizationsDelegates,
  ];

  static const List<Locale> supportedLocales = L10n.supportedLocales;
}
