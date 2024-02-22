import 'package:cat_breeds/domain/breed/model/breed.model.dart';
import 'package:cat_breeds/infrastructure/http/http.data_source.dart';

class BreedRepository extends HttpDataSource {
  BreedRepository() : super('/breeds');

  Future<List<CatBreed>> findAll() {
    return getList(itemCreator: CatBreed.fromJson);
  }
}
