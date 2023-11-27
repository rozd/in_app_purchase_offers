import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';

import '../product_details_with_offers.dart';
import 'impl/storekit_offer.dart';

Iterable<ProductDetailsWithOffers> mapper(Iterable<ProductDetails> products) {
  return products.whereType<AppStoreProductDetails>().map((product) {
    return ProductDetailsWithOffers(
      origin: product,
      introductoryOffer: product.skProduct.introductoryPrice != null ? StoreKitOffer(discount: product.skProduct.introductoryPrice!) : null,
      promotionalOffers: product.skProduct.discounts.map((discount) => StoreKitOffer(discount: discount)).toList()
    );
  });
}