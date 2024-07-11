import 'package:json_annotation/json_annotation.dart';

base class ProductEntity {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "image")
  final String image;
  @JsonKey(name: "price")
  final int price;
  @JsonKey(name: "sale_price")
  final int? salePrice;
  @JsonKey(name: "unit")
  final int unit;
  @JsonKey(name: "unit_text")
  final String unitText;

  ProductEntity(
      {required this.id,
      required this.title,
      required this.image,
      required this.price,
      required this.salePrice,
      required this.unit,
      required this.unitText});
}
