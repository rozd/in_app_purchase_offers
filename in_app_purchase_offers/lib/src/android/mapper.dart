import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:in_app_purchase_offers/src/android/impl/billing_client_offer.dart';

import '../../in_app_purchase_offers.dart';

const googlePlayIntroductoryOfferIds = { 'silver-monthly-introductory-free-trial' };

Iterable<ProductDetailsWithOffers> mapper(Iterable<ProductDetails> products) {
  final map = products
    .whereType<GooglePlayProductDetails>()
    .cast<GooglePlayProductDetails>()
    .fold(<String, List<GooglePlayProductDetails>>{}, (value, product) => value..update(product.id, (value) => value..add(product), ifAbsent: () => [product]));

  return map.map((id, products) => MapEntry(id, _mapProduct(productId: id, products: products)))
    .values
    .whereType<ProductDetailsWithOffers>()
    .cast<ProductDetailsWithOffers>();
}

ProductDetailsWithOffers? _mapProduct({required String productId, required List<GooglePlayProductDetails> products}) {
  late final GooglePlayProductDetails basePlanProduct;
  List<BillingClientOffer> introductoryOffers = [];
  List<BillingClientOffer> promotionalOffers = [];
  for (final product in products) {
    final index = product.subscriptionIndex;
    if (index == null) {
      continue;
    }
    final offer = product.productDetails.subscriptionOfferDetails?[index];
    if (offer == null) {
      continue;
    }
    if (offer.offerId == null) {
      basePlanProduct = product;
      continue;
    }
    if (googlePlayIntroductoryOfferIds.contains(offer.offerId)) {
      introductoryOffers.add(
        BillingClientOffer(
          product: product,
          offer: offer,
          type: OfferType.introductory,
        )
      );
      continue;
    }
    promotionalOffers.add(
      BillingClientOffer(
        product: product,
        offer: offer,
        type: OfferType.promotional,
      )
    );
  }

  return ProductDetailsWithOffers(
    origin: basePlanProduct,
    introductoryOffer: introductoryOffers.firstOrNull,
    promotionalOffers: promotionalOffers,
  );
}
