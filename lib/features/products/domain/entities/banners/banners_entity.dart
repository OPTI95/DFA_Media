import 'package:json_annotation/json_annotation.dart';

base class BannersEntity {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "link")
  final String link;
  @JsonKey(name: "image")
  final String image;

  BannersEntity(
      {required this.id,
      required this.link,
      required this.image,
      });
}
