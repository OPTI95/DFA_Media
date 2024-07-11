// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsModel _$ProductsModelFromJson(Map<String, dynamic> json) =>
    ProductsModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      image: json['image'] as String,
      price: (json['price'] as num).toInt(),
      salePrice: (json['sale_price'] as num?)?.toInt(),
      unit: (json['unit'] as num).toInt(),
      unitText: json['unit_text'] as String,
    );

Map<String, dynamic> _$ProductsModelToJson(ProductsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'price': instance.price,
      'sale_price': instance.salePrice,
      'unit': instance.unit,
      'unit_text': instance.unitText,
    };
