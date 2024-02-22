import 'dart:ui';

import 'package:cat_breeds/ui/framework/provider/base.view.model.dart';

class PragmaLocalizationViewModel extends BaseViewModel {
  Locale _current = const Locale('es');

  Locale get current => _current;

  void changeToSpanish() {
    _current = const Locale('es');
    notifyUI();
    notifyListeners();
  }

  void changeToEnglish() {
    _current = const Locale('en');
    notifyUI();
    notifyListeners();
  }
}
