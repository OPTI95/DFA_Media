// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banners_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannersModel _$BannersModelFromJson(Map<String, dynamic> json) => BannersModel(
      id: (json['id'] as num).toInt(),
      link: json['link'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$BannersModelToJson(BannersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'image': instance.image,
    };
