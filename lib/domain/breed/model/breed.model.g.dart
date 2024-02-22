// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatBreed _$CatBreedFromJson(Map<String, dynamic> json) => CatBreed(
      json['id'] as String,
      json['name'] as String,
      CatBreed._buildTemperament(json['temperament'] as String),
      json['origin'] as String,
      json['description'] as String,
      json['life_span'] as String,
      json['adaptability'] as int,
      json['intelligence'] as int,
      json['dog_friendly'] as int,
      json['child_friendly'] as int,
      json['wikipedia_url'] as String?,
      json['reference_image_id'] as String?,
    )..imagePath = json['imagePath'] as String?;

Map<String, dynamic> _$CatBreedToJson(CatBreed instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'temperament': instance.temperament,
      'origin': instance.origin,
      'description': instance.description,
      'life_span': instance.lifeSpan,
      'adaptability': instance.adaptability,
      'intelligence': instance.intelligence,
      'dog_friendly': instance.dogFriendly,
      'child_friendly': instance.childFriendly,
      'wikipedia_url': instance.wikipediaUrl,
      'reference_image_id': instance.imageId,
      'imagePath': instance.imagePath,
    };
