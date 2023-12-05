import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';

import '../offer.dart';

extension SKProductDiscountWrapperSerialization on SKProductDiscountWrapper {

  List<OfferPricingPhase> toOfferPhases() {
    return [OfferPricingPhase(
      price: OfferPrice(price: double.parse(price), priceForDisplay: price),
      period: subscriptionPeriod.asOfferPeriod(),
      paymentMode: paymentMode.asPaymentMode(),
    )];
  }

}

extension SKProductDiscountTypeSerialization on SKProductDiscountType {

  OfferType asOfferType() {
    switch (this) {
      case SKProductDiscountType.introductory:
        return OfferType.introductory;
      case SKProductDiscountType.subscription:
        return OfferType.promotional;
    }
  }

}

extension SKProductDiscountPaymentModeSerialization on SKProductDiscountPaymentMode {

  OfferPaymentMode asPaymentMode() {
    switch (this) {
      case SKProductDiscountPaymentMode.freeTrail:
        return OfferPaymentMode.freeTrial;
      case SKProductDiscountPaymentMode.payAsYouGo:
        return OfferPaymentMode.payAsYouGo;
      case SKProductDiscountPaymentMode.payUpFront:
        return OfferPaymentMode.payUpFront;
      default: // TODO: check if it is a best solution
        return OfferPaymentMode.payAsYouGo;
    }
  }

}

extension SKProductSubscriptionPeriodWrapperSerialization on SKProductSubscriptionPeriodWrapper {

  OfferPeriod asOfferPeriod() {
    return OfferPeriod(
      numberOfUnits: numberOfUnits,
      unit: unit.asOfferPeriodUnit(),
    );
  }

}

extension SKSubscriptionPeriodUnitSerialization on SKSubscriptionPeriodUnit {

  OfferPeriodUnit asOfferPeriodUnit() {
    switch (this) {
      case SKSubscriptionPeriodUnit.day:
        return OfferPeriodUnit.day;
      case SKSubscriptionPeriodUnit.month:
        return OfferPeriodUnit.month;
      case SKSubscriptionPeriodUnit.week:
        return OfferPeriodUnit.week;
      case SKSubscriptionPeriodUnit.year:
        return OfferPeriodUnit.year;
    }
  }
}