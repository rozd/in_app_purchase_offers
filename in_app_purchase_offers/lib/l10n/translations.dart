import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart' as intl;

/// A contract for the localized strings used by the library.
abstract class Translations {
  Translations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static Translations? of(BuildContext context) {
    return Localizations.of<Translations>(context, Translations);
  }

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
