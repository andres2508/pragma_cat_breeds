import 'package:json_annotation/json_annotation.dart';

part 'breed.model.g.dart';

@JsonSerializable()
class CatBreed {
  String id;
  String name;
  @JsonKey(fromJson: _buildTemperament)
  List<String> temperament;
  String origin;
  String description;
  @JsonKey(name: "life_span")
  String lifeSpan;
  int adaptability;
  int intelligence;
  @JsonKey(name: "dog_friendly")
  int dogFriendly;
  @JsonKey(name: "child_friendly")
  int childFriendly;
  @JsonKey(name: "wikipedia_url")
  String? wikipediaUrl;
  @JsonKey(name: "reference_image_id")
  String? imageId;
  String? imagePath;

  CatBreed(
      this.id,
      this.name,
      this.temperament,
      this.origin,
      this.description,
      this.lifeSpan,
      this.adaptability,
      this.intelligence,
      this.dogFriendly,
      this.childFriendly,
      this.wikipediaUrl,
      this.imageId);

  Map<String, dynamic> toJson() => _$CatBreedToJson(this);

  factory CatBreed.fromJson(Map<String, dynamic> json) {
    return _$CatBreedFromJson(json);
  }

  void updateImage(String imageUrl) => imagePath = imageUrl;

  static List<String> _buildTemperament(String value) {
    return value.split(',');
  }
}
