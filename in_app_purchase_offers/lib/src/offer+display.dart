import 'package:flutter/widgets.dart';
import 'package:in_app_purchase_offers/in_app_purchase_offers.dart';
import 'package:in_app_purchase_offers/l10n/translations_en.dart';

extension OfferForDisplay on Offer {

  String forDisplay(BuildContext context, {bool includeBasePlan = false}) {
    var result = '';
    for (var i = 0; i < phases.length; ++i) {
      final phase = phases[i];
      if (i == 0) {
        result += type.prefixForDisplay(context, paymentMode: phase.paymentMode);
      } else {
        result += ' ${context.l10n.wordThen} ';
      }
      result += phase.forDisplay(context);
    }
    return result;
  }

}

extension OfferPricingPhaseForDisplay on OfferPricingPhase {

  String forDisplay(BuildContext context) {
    switch (paymentMode) {
      case OfferPaymentMode.freeTrial:
        return '${period.forDisplayInSentence(context)} ${context.l10n.freeTrial}';
      case OfferPaymentMode.payAsYouGo:
        return '${price.forDisplay(context)} ${context.l10n.wordPer} ${period.unit.forDisplay(context)}  ${context.l10n.wordFor} ${period.forDisplay(context)}';
      case OfferPaymentMode.payUpFront:
        return '${price.forDisplay(context)} ${context.l10n.wordFor} ${period.forDisplay(context)}';

    }
  }

}

extension OfferTypeForDisplay on OfferType {

  String prefixForDisplay(BuildContext context, {required OfferPaymentMode paymentMode}) {
    switch (this) {
      case OfferType.introductory:
        switch (paymentMode) {
          case OfferPaymentMode.freeTrial:
            return context.l10n.introFreeTrialPrefix;
          case OfferPaymentMode.payAsYouGo:
            return context.l10n.introPayAsYouGoPrefix;
          case OfferPaymentMode.payUpFront:
            return context.l10n.introPayUpFrontPrefix;
        }
      case OfferType.promotional:
        switch (paymentMode) {
        case OfferPaymentMode.freeTrial:
        return context.l10n.promoFreeTrialPrefix;
        case OfferPaymentMode.payAsYouGo:
        return context.l10n.promoPayAsYouGoPrefix;
        case OfferPaymentMode.payUpFront:
        return context.l10n.promoPayUpFrontPrefix;
        }
    }
  }

}

extension OfferPriceForDisplay on OfferPrice {

  String forDisplay(BuildContext context) {
    return priceForDisplay;
  }

}

extension OfferPeriodForDisplay on OfferPeriod {

  String forDisplay(BuildContext context) {
    switch (unit) {
      case OfferPeriodUnit.day  :
        if (numberOfUnits == 7) {
          return context.l10n.nWeeks(1);
        }
        return context.l10n.nDays(numberOfUnits);
      case OfferPeriodUnit.week :
        return context.l10n.nWeeks(numberOfUnits);
      case OfferPeriodUnit.month:
        return context.l10n.nMonths(numberOfUnits);
      case OfferPeriodUnit.year :
        return context.l10n.nYears(numberOfUnits);
    }
  }

  String forDisplayInSentence(BuildContext context) {
    switch (unit) {
      case OfferPeriodUnit.day  :
        if (numberOfUnits == 7) {
          return context.l10n.nWeeks(1);
        }
        return context.l10n.nDaysInSentence(numberOfUnits);
      case OfferPeriodUnit.week :
        return context.l10n.nWeeksInSentence(numberOfUnits);
      case OfferPeriodUnit.month:
        return context.l10n.nMonthsInSentence(numberOfUnits);
      case OfferPeriodUnit.year :
        return context.l10n.nYearsInSentence(numberOfUnits);
    }
  }

}

extension OfferPeriodUnitForDisplay on OfferPeriodUnit {

  String forDisplay(BuildContext context) {
    switch (this) {
      case OfferPeriodUnit.day  :
        return context.l10n.day;
      case OfferPeriodUnit.week :
        return context.l10n.week;
      case OfferPeriodUnit.month:
        return context.l10n.month;
      case OfferPeriodUnit.year :
        return context.l10n.year;
    }
  }

}

// MARK: - Extensions

extension on BuildContext {

  Translations get l10n => Translations.of(this) ?? TranslationsEn();

}