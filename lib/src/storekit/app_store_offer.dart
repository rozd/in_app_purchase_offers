import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';

import '../offer.dart';
import 'serialization.dart';

class AppStoreOffer extends Offer {
  final SKProductDiscountWrapper discount;

  AppStoreOffer({
    required this.discount,
  }) : super(
    id: OfferId.fromValue(discount.identifier),
    type: discount.type.asOfferType(),
    phases: discount.toOfferPhases(),
  );
}