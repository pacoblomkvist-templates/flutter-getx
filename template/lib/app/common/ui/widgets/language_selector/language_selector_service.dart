import 'dart:convert';
import 'package:template/app/common/api/api_request_service.dart';

import 'language_model.dart';

class LanguageSelectorService {
  final ApiRequestService httpService;
  LanguageSelectorService({required this.httpService});

  Future<List<LanguageModel>> getLanguages() async {
    var response = await httpService.get(endpoint: "languages");
    var parsed = jsonDecode(response.body);
    var result =
        List<LanguageModel>.from(parsed.map((e) => LanguageModel.fromJson(e)));
    return result;
  }

  // Future sendLanguage(String lngCode) async {
  //   await httpService.putWithToken(
  //       endpoint: "user/language/update", body: {"language": lngCode});
  // }
}
