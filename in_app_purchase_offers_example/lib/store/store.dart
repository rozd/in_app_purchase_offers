import 'dart:async';

import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_offers/in_app_purchase_offers.dart';

const kSilverMonthly  = 'test.silver';
const kGoldMonthly    = 'test.gold';

class Store {

  Store();

  Future dispose() async {
    _products?.close();
    _products = null;
  }

  InAppPurchase get _iap => InAppPurchase.instance;

  // MARK: Products

  StreamController<List<ProductDetailsWithOffers>>? _products;
  Stream<List<ProductDetailsWithOffers>> get products => (
      _products ??= StreamController<List<ProductDetailsWithOffers>>(
        onListen: () {
          queryProducts();
        },
        onCancel: () {
          _products?.close();
          _products = null;
        }
      )
    ).stream;

  Future queryProducts() async {
    final res = await _iap.queryProductDetails({kSilverMonthly, kGoldMonthly});
    _products?.add(res.productDetailsWithOffers);
    return res;
  }

  // MARK: Purchases

  Future restorePurchases() {
    return _iap.restorePurchases();
  }

}