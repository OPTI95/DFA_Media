import 'package:dfa_media/features/products/domain/entities/banners/banners_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'banners_model.g.dart';


@JsonSerializable()
base class BannersModel extends BannersEntity {
  BannersModel({required super.id, required super.link, required super.image});
  factory BannersModel.fromJson(Map<String, dynamic> json) => _$BannersModelFromJson(json);
  Map<String, dynamic> toJson() => _$BannersModelToJson(this);
}