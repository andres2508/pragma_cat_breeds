import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocalizationContext on BuildContext {
  AppLocalizations loc() => AppLocalizations.of(this);
}

extension LocalizationInLocale on Locale {
  String localize(BuildContext context) {
    if (languageCode == 'es') {
      return context.loc().spanish;
    } else {
      return context.loc().english;
    }
  }
}
