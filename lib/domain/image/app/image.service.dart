import 'package:cat_breeds/domain/image/infrastructure/image.repository.dart';
import 'package:cat_breeds/domain/image/model/image.model.dart';

class ImageSourceService {
  final ImageRepository _repository = ImageRepository();

  Future<ImageSource> findById(String id) {
    return _repository.findById(id);
  }
}
