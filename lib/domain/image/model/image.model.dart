import 'package:json_annotation/json_annotation.dart';

part 'image.model.g.dart';

@JsonSerializable()
class ImageSource {
  String id;
  String url;

  ImageSource(this.id, this.url);

  Map<String, dynamic> toJson() => _$ImageSourceToJson(this);

  factory ImageSource.fromJson(Map<String, dynamic> json) {
    return _$ImageSourceFromJson(json);
  }
}
