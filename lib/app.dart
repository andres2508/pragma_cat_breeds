import 'package:cat_breeds/infrastructure/localization/localization.view.model.dart';
import 'package:cat_breeds/styles/theme.style.dart';
import 'package:cat_breeds/ui/framework/provider/view.model.consumer.dart';
import 'package:cat_breeds/ui/framework/router/router.builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class PragmaMobileApp extends StatelessWidget {
  final GoRouter router = PragmaRouterBuilder.initialize().build();

  PragmaMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PragmaLocalizationViewModel())
      ],
      child: ViewModelConsumer<PragmaLocalizationViewModel>(
        builder: (_, model) {
          return MaterialApp.router(
            title: 'Pragma - Cat Breeds',
            debugShowCheckedModeBanner: false,
            theme: PragmaMaterialTheme.light,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            routeInformationProvider: router.routeInformationProvider,
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
            locale: model.current,
          );
        },
      ),
    );
  }
}
