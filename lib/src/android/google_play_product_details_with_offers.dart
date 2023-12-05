import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:in_app_purchase_offers/in_app_purchase_offers.dart';

class GooglePlayProductDetailsWithOffers extends ProductDetailsWithOffers implements GooglePlayProductDetails {

  const GooglePlayProductDetailsWithOffers({
    required GooglePlayProductDetails origin,
    required super.introductoryOffer,
    required super.promotionalOffers,
  }) : super(origin: origin);

  const GooglePlayProductDetailsWithOffers.noOffers({
    required GooglePlayProductDetails origin,
  }) : super.noOffers(origin: origin);

  @override
  String? get offerToken => (origin as GooglePlayProductDetails).offerToken;

  @override
  ProductDetailsWrapper get productDetails => (origin as GooglePlayProductDetails).productDetails;

  @override
  int? get subscriptionIndex => (origin as GooglePlayProductDetails).subscriptionIndex;

}