import 'package:cat_breeds/domain/breed/infrastructure/breed.repository.dart';
import 'package:cat_breeds/domain/breed/model/breed.model.dart';
import 'package:cat_breeds/domain/image/app/image.service.dart';
import 'package:cat_breeds/infrastructure/locator/service.locator.dart';

class CatBreedService {
  final BreedRepository _repository = BreedRepository();
  final ImageSourceService _imageService = serviceLocator<ImageSourceService>();

  Future<List<CatBreed>> findAll() async {
    // Find all breeds
    final all = await _repository.findAll();
    // Find image path by breed
    for (var breed in all) {
      if (breed.imageId != null) {
        final currentImage = await _imageService.findById(breed.imageId!);
        breed.updateImage(currentImage.url);
      }
    }
    return all;
  }
}
