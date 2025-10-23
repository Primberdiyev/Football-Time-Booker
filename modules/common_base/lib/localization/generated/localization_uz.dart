// ignore_for_file: always_use_package_imports

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'localization.dart';

// ignore_for_file: type=lint

/// The translations for Uzbek (`uz`).
class L10nUz extends L10n {
  L10nUz([String locale = 'uz']) : super(locale);

  @override
  String get fcBoston => 'FC Bo\'ston';

  @override
  String get welcome => 'Xush Kelibsiz!';

  @override
  String get enterLogin => 'Login kiriting';

  @override
  String get enterPassword => 'Parol kiriting';

  @override
  String get login => 'Kirish';

  @override
  String get noRegistered => 'Bu Login Parol tizimdan ro\'yhatdan o\'tmagan';

  @override
  String get notRegisteredYet => 'Bu foydalanuvchi ro\'yhatdan o\'tmagan!';

  @override
  String get fillField => 'Iltimos, Barcha maydonlarni to\'ldiring';
}
