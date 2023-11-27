library in_app_purchase_offers;

import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_offers/src/android/mapper.dart' as android;
import 'package:in_app_purchase_offers/src/storekit/mapper.dart' as storekit;

import 'src/product_details_with_offers.dart';

export 'src/offer.dart';
export 'src/offer_display.dart';
export 'src/product_details_with_offers.dart';

extension ProductDetailsResponseWithOffers on ProductDetailsResponse {

  List<ProductDetailsWithOffers> get productDetailsWithOffers {
    return productDetails.withOffers.toList();
  }

}

extension IterableProductDetailsWithOffers on Iterable<ProductDetails> {

  Iterable<ProductDetailsWithOffers> get withOffers {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return android.mapper(this);
    } else if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.macOS) {
      return storekit.mapper(this);
    } else {
      throw UnsupportedError('Platform not supported');
    }
  }

}