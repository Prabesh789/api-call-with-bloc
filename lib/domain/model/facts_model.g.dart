// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Facts _$FactsFromJson(Map<String, dynamic> json) {
  return Facts(
    id: json['id'] as int,
    title: json['title'] as String,
    description: json['description'] as String,
    image_url: json['image_url'] as String,
  );
}

Map<String, dynamic> _$FactsToJson(Facts instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'image_url': instance.image_url,
    };
