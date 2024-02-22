import 'package:cat_breeds/domain/breed/app/breed.service.dart';
import 'package:cat_breeds/domain/breed/model/breed.model.dart';
import 'package:cat_breeds/infrastructure/locator/service.locator.dart';
import 'package:cat_breeds/ui/framework/provider/base.view.model.dart';

class CatBreedViewModel extends BaseViewModel {
  final CatBreedService _service = serviceLocator<CatBreedService>();
  List<CatBreed> _items = [];

  List<CatBreed> get items => _items;

  Future<void> loadRequired() async {
    await runWithHandlingError(() async {
      _items = await _service.findAll();
    });
    notifyUI();
    notifyListeners();
  }
}
