class Offer {
  final OfferId? id;
  final OfferType type;

  final List<OfferPricingPhase> phases;

  const Offer({
    required this.id,
    required this.type,
    required this.phases,
  });
}

// MARK: OfferId

class OfferId {
  final String value;

  const OfferId({required this.value});

  static OfferId? fromValue(String? value) {
    return value != null ? OfferId(value: value) : null;
  }

  @override
  String toString() => value;
}

// MARK: OfferType

enum OfferType {
  introductory,
  promotional,
}

// MARK: OfferPaymentMode

enum OfferPaymentMode {
  freeTrial,
  payAsYouGo,
  payUpFront,
}

// MARK: OfferPeriod

class OfferPeriod {
  final OfferPeriodUnit unit;
  final int numberOfUnits;
  OfferPeriod({required this.unit, required this.numberOfUnits});
}

enum OfferPeriodUnit {
  day,
  week,
  month,
  year,
}

// MARK: OfferPrice

class OfferPrice {
  final double price;
  final String priceForDisplay;

  const OfferPrice({
    required this.price,
    required this.priceForDisplay,
  });
}

// MARK: OfferPricingPhase

class OfferPricingPhase {
  final OfferPrice price;
  final OfferPeriod period;
  final OfferPaymentMode paymentMode;

  const OfferPricingPhase({
    required this.price,
    required this.period,
    required this.paymentMode,
  });
}