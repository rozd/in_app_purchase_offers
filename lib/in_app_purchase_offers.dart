library in_app_purchase_offers;

import 'package:flutter/foundation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_offers/src/android/mapper.dart' as android;
import 'package:in_app_purchase_offers/src/storekit/mapper.dart' as storekit;

import 'src/product_details_with_offers.dart';

export 'src/android/google_play_offer.dart';
export 'src/android/google_play_product_details_with_offers.dart';
export 'src/offer+display.dart';
export 'src/offer.dart';
export 'src/product_details_with_offers.dart';
export 'src/storekit/app_store_offer.dart';
export 'src/storekit/app_store_product_details_with_offers.dart';

export 'l10n/translations.dart';

// MARK: - InAppPurchaseOffers plugin entry point

class InAppPurchaseOffers {
  static Set<String>? _googlePlayIntroductoryOfferIds;
  static Set<String> get googlePlayIntroductoryOfferIds => _googlePlayIntroductoryOfferIds ?? {};
  static void configure({
    required Set<String> googlePlayIntroductoryOfferIds
  }) {
    assert(_googlePlayIntroductoryOfferIds == null, 'InAppPurchaseOffers.configure() can only be called once');
    _googlePlayIntroductoryOfferIds = googlePlayIntroductoryOfferIds;
  }
}

// MARK: - InAppPurchase plugin extensions

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