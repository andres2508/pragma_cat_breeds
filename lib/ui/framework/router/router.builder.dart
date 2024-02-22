import 'package:cat_breeds/infrastructure/locator/service.locator.dart';
import 'package:cat_breeds/ui/breed/breed.module.dart';
import 'package:cat_breeds/ui/framework/dialog/dialogs.service.dart';
import 'package:cat_breeds/ui/framework/router/error_page.view.dart';
import 'package:cat_breeds/ui/framework/router/pragma.module.dart';
import 'package:go_router/go_router.dart';

List<PragmaModule> _modules = [
  // Insert all route modules implemented
  CatBreedModule()
];

class PragmaRouterBuilder {
  final List<GoRoute> _routes;

  PragmaRouterBuilder._intern(this._routes);

  factory PragmaRouterBuilder.initialize() {
    final List<GoRoute> routes = [];
    // Initialize routes
    for (var module in _modules) {
      routes.addAll(module.routes());
    }
    return PragmaRouterBuilder._intern(routes);
  }

  GoRouter build() {
    return GoRouter(
      routes: _routes,
      initialLocation: '/home',
      redirect: (context, state) {
        // Change context in message listener
        serviceLocator<DialogsService>().changeContext(context);
        // ToDo: validate session active
        return null;
      },
      errorBuilder: (_, routerState) =>
          ErrorPageView.of(routerState.error.toString()),
    );
  }
}
