// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoriesModel _$StoriesModelFromJson(Map<String, dynamic> json) => StoriesModel(
      id: (json['id'] as num).toInt(),
      previewImage: json['preview_image'] as String,
      viewed: json['viewed'] as bool,
      isBookmark: json['is_bookmark'] as bool,
      position: json['position'] as String,
      title: json['title'] as String,
      slidesModel: (json['slides'] as List<dynamic>)
          .map((e) => SlidesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StoriesModelToJson(StoriesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'preview_image': instance.previewImage,
      'viewed': instance.viewed,
      'is_bookmark': instance.isBookmark,
      'position': instance.position,
      'title': instance.title,
      'slides': instance.slidesModel,
    };
