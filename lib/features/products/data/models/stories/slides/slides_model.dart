import 'package:dfa_media/features/products/domain/entities/stories/slides/slides_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'slides_model.g.dart';

@JsonSerializable()
base class SlidesModel extends SlidesEntity {
  SlidesModel(
      {required super.id,
      required super.image,
      required super.preTitle,
      required super.title,
      required super.text,
      required super.buttonLink,
      required super.textPosition,
      required super.isButton});

  factory SlidesModel.fromJson(Map<String, dynamic> json) => _$SlidesModelFromJson(json);

  Map<String, dynamic> toJson() => _$SlidesModelToJson(this);
}
