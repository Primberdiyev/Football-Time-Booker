// ignore_for_file: always_use_package_imports
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'localization_uz.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of L10n
/// returned by `L10n.of(context)`.
///
/// Applications need to include `L10n.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/localization.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10n.localizationsDelegates,
///   supportedLocales: L10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L10n.supportedLocales
/// property.
abstract class L10n {
  L10n(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10n of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n)!;
  }

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('uz')
  ];

  /// No description provided for @fcBoston.
  ///
  /// In uz, this message translates to:
  /// **'FC Bo\'ston'**
  String get fcBoston;

  /// No description provided for @welcome.
  ///
  /// In uz, this message translates to:
  /// **'Xush Kelibsiz!'**
  String get welcome;

  /// No description provided for @enterLogin.
  ///
  /// In uz, this message translates to:
  /// **'Login kiriting'**
  String get enterLogin;

  /// No description provided for @enterPassword.
  ///
  /// In uz, this message translates to:
  /// **'Parol kiriting'**
  String get enterPassword;

  /// No description provided for @login.
  ///
  /// In uz, this message translates to:
  /// **'Kirish'**
  String get login;

  /// No description provided for @noRegistered.
  ///
  /// In uz, this message translates to:
  /// **'Bu Login Parol tizimdan ro\'yhatdan o\'tmagan'**
  String get noRegistered;

  /// No description provided for @notRegisteredYet.
  ///
  /// In uz, this message translates to:
  /// **'Bu foydalanuvchi ro\'yhatdan o\'tmagan!'**
  String get notRegisteredYet;

  /// No description provided for @fillField.
  ///
  /// In uz, this message translates to:
  /// **'Iltimos, Barcha maydonlarni to\'ldiring'**
  String get fillField;

  /// No description provided for @main.
  ///
  /// In uz, this message translates to:
  /// **'Asosiy'**
  String get main;

  /// No description provided for @statistics.
  ///
  /// In uz, this message translates to:
  /// **'Hisobot'**
  String get statistics;

  /// No description provided for @monday.
  ///
  /// In uz, this message translates to:
  /// **'Du'**
  String get monday;

  /// No description provided for @tuesday.
  ///
  /// In uz, this message translates to:
  /// **'Se'**
  String get tuesday;

  /// No description provided for @wednesday.
  ///
  /// In uz, this message translates to:
  /// **'Chor'**
  String get wednesday;

  /// No description provided for @thursday.
  ///
  /// In uz, this message translates to:
  /// **'Pay'**
  String get thursday;

  /// No description provided for @friday.
  ///
  /// In uz, this message translates to:
  /// **'Juma'**
  String get friday;

  /// No description provided for @saturday.
  ///
  /// In uz, this message translates to:
  /// **'Shan'**
  String get saturday;

  /// No description provided for @sunday.
  ///
  /// In uz, this message translates to:
  /// **'Yak'**
  String get sunday;

  /// No description provided for @january.
  ///
  /// In uz, this message translates to:
  /// **'YAN'**
  String get january;

  /// No description provided for @february.
  ///
  /// In uz, this message translates to:
  /// **'FEV'**
  String get february;

  /// No description provided for @march.
  ///
  /// In uz, this message translates to:
  /// **'MAR'**
  String get march;

  /// No description provided for @april.
  ///
  /// In uz, this message translates to:
  /// **'APR'**
  String get april;

  /// No description provided for @may.
  ///
  /// In uz, this message translates to:
  /// **'MAY'**
  String get may;

  /// No description provided for @june.
  ///
  /// In uz, this message translates to:
  /// **'IYUN'**
  String get june;

  /// No description provided for @july.
  ///
  /// In uz, this message translates to:
  /// **'IYUL'**
  String get july;

  /// No description provided for @august.
  ///
  /// In uz, this message translates to:
  /// **'AVG'**
  String get august;

  /// No description provided for @september.
  ///
  /// In uz, this message translates to:
  /// **'SEN'**
  String get september;

  /// No description provided for @october.
  ///
  /// In uz, this message translates to:
  /// **'OKT'**
  String get october;

  /// No description provided for @november.
  ///
  /// In uz, this message translates to:
  /// **'NOY'**
  String get november;

  /// No description provided for @december.
  ///
  /// In uz, this message translates to:
  /// **'DEK'**
  String get december;

  /// No description provided for @openedStadium.
  ///
  /// In uz, this message translates to:
  /// **'Yopiq Stadion'**
  String get openedStadium;

  /// No description provided for @closedStadium.
  ///
  /// In uz, this message translates to:
  /// **'Ochiq Stadion'**
  String get closedStadium;

  /// No description provided for @book.
  ///
  /// In uz, this message translates to:
  /// **'Band qilish'**
  String get book;

  /// No description provided for @time17.
  ///
  /// In uz, this message translates to:
  /// **'17:00 - 18:00'**
  String get time17;

  /// No description provided for @time18.
  ///
  /// In uz, this message translates to:
  /// **'18:00 - 19:00'**
  String get time18;

  /// No description provided for @time19.
  ///
  /// In uz, this message translates to:
  /// **'18:00 - 19:00'**
  String get time19;

  /// No description provided for @time20.
  ///
  /// In uz, this message translates to:
  /// **'19:00 - 20:00'**
  String get time20;

  /// No description provided for @time21.
  ///
  /// In uz, this message translates to:
  /// **'20:00 - 21:00'**
  String get time21;

  /// No description provided for @time22.
  ///
  /// In uz, this message translates to:
  /// **'21:00 - 22:00'**
  String get time22;

  /// No description provided for @time23.
  ///
  /// In uz, this message translates to:
  /// **'22:00 - 23:00'**
  String get time23;

  /// No description provided for @time24.
  ///
  /// In uz, this message translates to:
  /// **'23:00 - 23:59'**
  String get time24;

  /// No description provided for @booker.
  ///
  /// In uz, this message translates to:
  /// **'Band qiluvchi'**
  String get booker;

  /// No description provided for @phoneNumber.
  ///
  /// In uz, this message translates to:
  /// **'Telefon raqami'**
  String get phoneNumber;

  /// No description provided for @isConstant.
  ///
  /// In uz, this message translates to:
  /// **'Doimiyligi'**
  String get isConstant;

  /// No description provided for @selectedTime.
  ///
  /// In uz, this message translates to:
  /// **'Tanlangan vaqt: '**
  String get selectedTime;

  /// No description provided for @isLocalLabel.
  ///
  /// In uz, this message translates to:
  /// **'Bo\'ston mahallasidan'**
  String get isLocalLabel;

  /// No description provided for @isRegularLabel.
  ///
  /// In uz, this message translates to:
  /// **'Doimiyligi'**
  String get isRegularLabel;

  /// No description provided for @yes.
  ///
  /// In uz, this message translates to:
  /// **'Ha'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In uz, this message translates to:
  /// **'Yo\'q'**
  String get no;
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  Future<L10n> load(Locale locale) {
    return SynchronousFuture<L10n>(lookupL10n(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['uz'].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDelegate old) => false;
}

L10n lookupL10n(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'uz': return L10nUz();
  }

  throw FlutterError(
    'L10n.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
