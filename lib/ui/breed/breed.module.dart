import 'package:cat_breeds/ui/breed/breed.view.dart';
import 'package:cat_breeds/ui/framework/router/pragma.module.dart';
import 'package:go_router/src/route.dart';

class CatBreedModule extends PragmaModule {
  @override
  List<GoRoute> routes() {
    return [
      GoRoute(path: '/home', builder: (_, __) => const CatBreedMainView())
    ];
  }
}
