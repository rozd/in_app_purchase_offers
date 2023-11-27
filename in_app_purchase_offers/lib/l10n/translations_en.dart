// ignore_for_file: no_leading_underscores_for_local_identifiers, unnecessary_string_interpolations

import 'package:intl/intl.dart' as intl;

import 'translations.dart';

/// The translations for English (`en`).
class TranslationsEn extends Translations {
  TranslationsEn([String locale = 'en']) : super(locale);

  @override
  String get introFreeTrialPrefix => 'Start with ';

  @override
  String get introPayAsYouGoPrefix => 'Start at ';

  @override
  String get introPayUpFrontPrefix => 'Start with a budget of ';

  @override
  String get promoFreeTrialPrefix => 'Try us with ';

  @override
  String get promoPayAsYouGoPrefix => 'Start at ';

  @override
  String get promoPayUpFrontPrefix => 'Pay only ';

  @override
  String get freeTrial => 'free trial';

  @override
  String get wordThen => 'then';

  @override
  String get wordPer => 'per';

  @override
  String get wordFor => 'for';

  @override
  String get day => 'day';

  @override
  String get week => 'week';

  @override
  String get month => 'month';

  @override
  String get year => 'year';

  @override
  String nDaysInSentence(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'a $countString days',
      one: 'an one day',
    );
    return '$_temp0';
  }

  @override
  String nWeeksInSentence(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'a $countString weeks',
      one: 'an one week',
    );
    return '$_temp0';
  }

  @override
  String nMonthsInSentence(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'a $countString months',
      one: 'an one month',
    );
    return '$_temp0';
  }

  @override
  String nYearsInSentence(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'a $countString years',
      one: 'an one year',
    );
    return '$_temp0';
  }

  @override
  String nDays(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString days',
      one: 'one day',
    );
    return '$_temp0';
  }

  @override
  String nWeeks(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString weeks',
      one: 'one week',
    );
    return '$_temp0';
  }

  @override
  String nMonths(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString months',
      one: 'one month',
    );
    return '$_temp0';
  }

  @override
  String nYears(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
      
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString years',
      one: 'one year',
    );
    return '$_temp0';
  }
}
