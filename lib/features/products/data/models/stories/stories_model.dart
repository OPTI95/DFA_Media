import 'package:dfa_media/features/products/data/models/stories/slides/slides_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/stories/stories_entity.dart';
part 'stories_model.g.dart';

@JsonSerializable()
base class StoriesModel extends StoriesEntity {
  StoriesModel(
      {required super.id,
      required super.previewImage,
      required super.viewed,
      required super.isBookmark,
      required super.position,
      required super.title,
      required this.slidesModel})
      : super(slides: slidesModel);
  @JsonKey(name: 'slides')
  final List<SlidesModel> slidesModel;
  factory StoriesModel.fromJson(Map<String, dynamic> json) =>
      _$StoriesModelFromJson(json);
  Map<String, dynamic> toJson() => _$StoriesModelToJson(this);
}
