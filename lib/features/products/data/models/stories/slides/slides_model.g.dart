// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slides_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SlidesModel _$SlidesModelFromJson(Map<String, dynamic> json) => SlidesModel(
      id: (json['id'] as num).toInt(),
      image: json['image'] as String,
      preTitle: json['pre_title'] as String,
      title: json['title'] as String,
      text: json['text'] as String,
      buttonLink: json['button_link'] as String,
      textPosition: json['text_position'] as String,
      isButton: json['is_button'] as bool,
    );

Map<String, dynamic> _$SlidesModelToJson(SlidesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'pre_title': instance.preTitle,
      'title': instance.title,
      'text': instance.text,
      'button_link': instance.buttonLink,
      'text_position': instance.textPosition,
      'is_button': instance.isButton,
    };
