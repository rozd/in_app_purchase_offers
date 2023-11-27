import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:in_app_purchase_offers/src/android/impl/serialization.dart';

import '../../../in_app_purchase_offers.dart';

class BillingClientOffer extends Offer {
  final GooglePlayProductDetails product;
  final SubscriptionOfferDetailsWrapper offer;

  BillingClientOffer({
    required this.product,
    required this.offer,
    required super.type,
  }) : super(
    id: OfferId.fromValue(offer.offerId),
    phases: offer.pricingPhases
      .where((phase) => phase.recurrenceMode != RecurrenceMode.infiniteRecurring)
      .map((phase) => phase.asOfferPricingPhase()).toList(),
  );
}