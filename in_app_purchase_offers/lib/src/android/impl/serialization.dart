import 'package:in_app_purchase_android/billing_client_wrappers.dart';

import '../../../in_app_purchase_offers.dart';

extension SubscriptionOfferDetailsWrapperSerialization on SubscriptionOfferDetailsWrapper {



}

extension PricingPhaseWrapperSerialization on PricingPhaseWrapper {

  OfferPricingPhase asOfferPricingPhase() {
    return OfferPricingPhase(
      price: OfferPrice(
        price: priceAmountMicros / 1000000,
        priceForDisplay: formattedPrice,
      ),
      period: billingPeriod.parseToOfferPeriod(),
      paymentMode: priceAmountMicros == 0
        ? OfferPaymentMode.freeTrial
        : billingCycleCount == 1
          ? OfferPaymentMode.payUpFront
          : OfferPaymentMode.payAsYouGo,
    );
  }

}

extension on String {

  OfferPeriod parseToOfferPeriod() {
    final regex = RegExp(r'P(?<numberOfUnits>\d)(?<unit>[DWMY])');
    final match = regex.firstMatch(this);
    if (match == null) {
      throw ArgumentError('Invalid period: $this');
    }
    final unitString = match.namedGroup('unit');
    if (unitString == null) {
      throw ArgumentError('Invalid period: $this');
    }
    final numberOfUnitsString = match.namedGroup('numberOfUnits');
    if (numberOfUnitsString == null) {
      throw ArgumentError('Invalid period: $this');
    }
    final unit = unitString.parseToOfferPeriodUnit();
    final numberOfUnits = int.parse(numberOfUnitsString);

    return OfferPeriod(
      unit: unit,
      numberOfUnits: numberOfUnits,
    );
  }

  OfferPeriodUnit parseToOfferPeriodUnit() {
    switch (this) {
      case 'D':
        return OfferPeriodUnit.day;
      case 'W':
        return OfferPeriodUnit.week;
      case 'M':
        return OfferPeriodUnit.month;
      case 'Y':
        return OfferPeriodUnit.year;
      default:
        throw ArgumentError('Invalid period unit: $this');
    }
  }

}