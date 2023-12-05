import 'package:in_app_purchase/in_app_purchase.dart';
import 'offer.dart';

abstract class ProductDetailsWithOffers implements ProductDetails {
  final ProductDetails origin;

  final Offer? introductoryOffer;
  final List<Offer> promotionalOffers;

  const ProductDetailsWithOffers({
    required this.origin,
    required this.introductoryOffer,
    required this.promotionalOffers,
  });

  const ProductDetailsWithOffers.noOffers({
    required this.origin,
  }) : introductoryOffer = null, promotionalOffers = const [];

  @override
  String get currencyCode => origin.currencyCode;

  @override
  String get currencySymbol => origin.currencySymbol;

  @override
  String get description => origin.description;

  @override
  String get id => origin.id;

  @override
  String get price => origin.price;

  @override
  double get rawPrice => origin.rawPrice;

  @override
  String get title => origin.title;
}
