import 'package:common_base/common_base.dart';
import 'package:flutter/material.dart';

extension LocalizationEx on BuildContext {
  L10n get appLocale => L10n.of(this);
}
