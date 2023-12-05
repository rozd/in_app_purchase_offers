import 'package:in_app_purchase_offers/in_app_purchase_offers.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';

class AppStoreProductDetailsWithOffers extends ProductDetailsWithOffers implements AppStoreProductDetails {

  const AppStoreProductDetailsWithOffers({
    required AppStoreProductDetails origin,
    required super.introductoryOffer,
    required super.promotionalOffers,
  }) : super(origin: origin);

  const AppStoreProductDetailsWithOffers.noOffers({
    required AppStoreProductDetails origin,
  }) : super.noOffers(origin: origin);

  @override
  SKProductWrapper get skProduct => (origin as AppStoreProductDetails).skProduct;

}