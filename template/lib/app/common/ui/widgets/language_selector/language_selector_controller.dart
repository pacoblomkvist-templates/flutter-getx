import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:get/get.dart';
import 'package:template/app/common/l10n/language_service.dart';

import 'language_model.dart';
import 'language_selector_service.dart';

class LanguageSelectorController extends GetxController {
  final AppLanguageService _appLngservice = Get.find();
  final _service = LanguageSelectorService(httpService: Get.find());
  final _selectedLanguage = Rx<LanguageModel?>(null);
  var languages = <LanguageModel>[].obs;

  LanguageModel? get selectedLanguage => _selectedLanguage.value;
  set selectedLanguage(LanguageModel? value) => _selectedLanguage.value = value;

  init(BuildContext context) async {
    await fetchLanguages();

    var appLanguage = (await _appLngservice.getAppLanguage()) ??
        FlutterI18n.currentLocale(context)?.languageCode;
    if (appLanguage != null) {
      selectedLanguage =
          languages.singleWhere((element) => element.iso == appLanguage);
    } else {
      selectedLanguage = languages.first;
    }
  }

  Future<List<LanguageModel>> fetchLanguages() async {
    languages.value = await _service.getLanguages();
    return languages;
  }

  Future selectLanguage(LanguageModel lng) async {
    selectedLanguage = lng;
  }
}
