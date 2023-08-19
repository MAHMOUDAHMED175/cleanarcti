import 'package:equatable/equatable.dart';

import 'list_price.dart';
import 'retail_price.dart';

class Offer extends Equatable {
  final num? finskyOfferType;
  final ListPrice? listPrice;
  final RetailPrice? retailPrice;

  const Offer({this.finskyOfferType, this.listPrice, this.retailPrice});

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        finskyOfferType: json['finskyOfferType'] as num?,
        listPrice: json['listPrice'] == null
            ? null
            : ListPrice.fromJson(json['listPrice'] as Map<String, dynamic>),
        retailPrice: json['retailPrice'] == null
            ? null
            : RetailPrice.fromJson(json['retailPrice'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'finskyOfferType': finskyOfferType,
        'listPrice': listPrice?.toJson(),
        'retailPrice': retailPrice?.toJson(),
      };

  Offer copyWith({
    num? finskyOfferType,
    ListPrice? listPrice,
    RetailPrice? retailPrice,
  }) {
    return Offer(
      finskyOfferType: finskyOfferType ?? this.finskyOfferType,
      listPrice: listPrice ?? this.listPrice,
      retailPrice: retailPrice ?? this.retailPrice,
    );
  }

  @override
  List<Object?> get props => [finskyOfferType, listPrice, retailPrice];
}
