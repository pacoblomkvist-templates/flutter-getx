import 'dart:ui';

import 'package:flutter_i18n/flutter_i18n.dart';

import 'file_namespaces.dart';

final FlutterI18nDelegate translatorDelegate = FlutterI18nDelegate(
  translationLoader: NamespaceFileTranslationLoader(
    namespaces: namespaces,
    useCountryCode: false,
    fallbackDir: 'en',
    basePath: 'assets/l10n',
  ),
  missingTranslationHandler: (key, locale) {
    print("--- Missing Key: $key, languageCode: ${locale!.languageCode}");
  },
);
