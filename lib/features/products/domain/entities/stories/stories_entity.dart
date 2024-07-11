import 'package:json_annotation/json_annotation.dart';

import 'slides/slides_entity.dart';

base class StoriesEntity {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "preview_image")
  final String previewImage;
  @JsonKey(name: "viewed")
  final bool viewed;
  @JsonKey(name: "is_bookmark")
  final bool isBookmark;
  @JsonKey(name: "position")
  final String position;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "slides")
  final SlidesEntity slides;

  StoriesEntity(
      {required this.id,
      required this.previewImage,
      required this.viewed,
      required this.isBookmark,
      required this.position,
      required this.title,
      required this.slides});
}
