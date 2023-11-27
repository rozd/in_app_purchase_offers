import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'translations_en.dart';

/// Callers can lookup localized strings with an instance of Translations
/// returned by `Translations.of(context)`.
///
/// Applications need to include `Translations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/translations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: Translations.localizationsDelegates,
///   supportedLocales: Translations.supportedLocales,
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
/// be consistent with the languages listed in the Translations.supportedLocales
/// property.
abstract class Translations {
  Translations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static Translations? of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

  static const LocalizationsDelegate<Translations> delegate = _TranslationsDelegate();

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
    Locale('en')
  ];

  /// No description provided for @introFreeTrialPrefix.
  ///
  /// In en, this message translates to:
  /// **'Start with '**
  String get introFreeTrialPrefix;

  /// No description provided for @introPayAsYouGoPrefix.
  ///
  /// In en, this message translates to:
  /// **'Start at '**
  String get introPayAsYouGoPrefix;

  /// No description provided for @introPayUpFrontPrefix.
  ///
  /// In en, this message translates to:
  /// **'Start with a budget of '**
  String get introPayUpFrontPrefix;

  /// No description provided for @promoFreeTrialPrefix.
  ///
  /// In en, this message translates to:
  /// **'Try us with '**
  String get promoFreeTrialPrefix;

  /// No description provided for @promoPayAsYouGoPrefix.
  ///
  /// In en, this message translates to:
  /// **'Start at '**
  String get promoPayAsYouGoPrefix;

  /// No description provided for @promoPayUpFrontPrefix.
  ///
  /// In en, this message translates to:
  /// **'Pay only '**
  String get promoPayUpFrontPrefix;

  /// No description provided for @freeTrial.
  ///
  /// In en, this message translates to:
  /// **'free trial'**
  String get freeTrial;

  /// No description provided for @wordThen.
  ///
  /// In en, this message translates to:
  /// **'then'**
  String get wordThen;

  /// No description provided for @wordPer.
  ///
  /// In en, this message translates to:
  /// **'per'**
  String get wordPer;

  /// No description provided for @wordFor.
  ///
  /// In en, this message translates to:
  /// **'for'**
  String get wordFor;

  /// No description provided for @day.
  ///
  /// In en, this message translates to:
  /// **'day'**
  String get day;

  /// No description provided for @week.
  ///
  /// In en, this message translates to:
  /// **'week'**
  String get week;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'month'**
  String get month;

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'year'**
  String get year;

  /// Label for the number of days
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{an one day} other{a {count} days}}'**
  String nDaysInSentence(num count);

  /// Label for the number of weeks
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{an one week} other{a {count} weeks}}'**
  String nWeeksInSentence(num count);

  /// Label for the number of months
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{an one month} other{a {count} months}}'**
  String nMonthsInSentence(num count);

  /// Label for the number of years
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{an one year} other{a {count} years}}'**
  String nYearsInSentence(num count);

  /// Label for the number of days
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{one day} other{{count} days}}'**
  String nDays(num count);

  /// Label for the number of weeks
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{one week} other{{count} weeks}}'**
  String nWeeks(num count);

  /// Label for the number of months
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{one month} other{{count} months}}'**
  String nMonths(num count);

  /// Label for the number of years
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{one year} other{{count} years}}'**
  String nYears(num count);
}

class _TranslationsDelegate extends LocalizationsDelegate<Translations> {
  const _TranslationsDelegate();

  @override
  Future<Translations> load(Locale locale) {
    return SynchronousFuture<Translations>(lookupTranslations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_TranslationsDelegate old) => false;
}

Translations lookupTranslations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return TranslationsEn();
  }

  throw FlutterError(
    'Translations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
