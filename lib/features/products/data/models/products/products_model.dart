import 'package:dfa_media/features/products/domain/entities/banners/banners_entity.dart';
import 'package:dfa_media/features/products/domain/entities/product/product_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'products_model.g.dart';

@JsonSerializable()
base class ProductsModel extends ProductEntity {
  ProductsModel(
      {required super.id,
      required super.title,
      required super.image,
      required super.price,
      required super.salePrice,
      required super.unit,
      required super.unitText});
  factory ProductsModel.fromJson(Map<String, dynamic> json) => _$ProductsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsModelToJson(this);
}
