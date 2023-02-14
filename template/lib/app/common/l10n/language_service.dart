import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppLanguageService {
  final _storage = const FlutterSecureStorage();
  Future<String?> getAppLanguage() async {
    return await _storage.read(key: "language");
  }

  Future setAndChangeAppLanguage(String language, BuildContext context) async {
    await changeAppLanguage(language, context);
    await _storage.write(key: "language", value: language);
  }

  Future changeAppLanguage(String language, BuildContext context) async {
    await FlutterI18n.refresh(context, Locale(language));
  }

  Future setUpAppLanguage(BuildContext context) async {
    var lng = await getAppLanguage();
    if (lng != null) {
      await changeAppLanguage(lng, context);
    } else {
      var localeLng = Platform.localeName.substring(0, 2);
      //var localeLng = FlutterI18n.currentLocale(context)?.languageCode;
      await setAndChangeAppLanguage(localeLng, context);
    }
  }
}
