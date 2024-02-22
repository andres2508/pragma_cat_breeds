import 'package:cat_breeds/domain/image/model/image.model.dart';
import 'package:cat_breeds/infrastructure/http/http.data_source.dart';

class ImageRepository extends HttpDataSource {
  ImageRepository() : super('/images');

  Future<ImageSource> findById(String id) {
    return getItem(path: '$id', itemCreator: ImageSource.fromJson);
  }
}
