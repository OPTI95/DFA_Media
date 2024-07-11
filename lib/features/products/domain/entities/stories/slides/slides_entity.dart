import 'package:json_annotation/json_annotation.dart';

base class SlidesEntity {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "image")
  final String image;
  @JsonKey(name: "pre_title")
  final String preTitle;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "text")
  final String text;
  @JsonKey(name: "button_link")
  final String buttonLink;
  @JsonKey(name: "text_position")
  final String textPosition;
  @JsonKey(name: "is_button")
  final bool isButton;

  SlidesEntity(
      {required this.id,
      required this.image,
      required this.preTitle,
      required this.title,
      required this.text,
      required this.buttonLink,
      required this.textPosition,
      required this.isButton});
}
