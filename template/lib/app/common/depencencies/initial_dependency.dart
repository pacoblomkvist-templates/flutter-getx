import 'package:get/get.dart';
import 'package:template/app/common/api/api_request_service.dart';
import 'package:template/app/common/api/http_response_handler.dart';
import 'package:template/app/common/api/http_response_handler.dart';
import 'package:template/app/common/api/token_service.dart';
import 'package:template/config/build_config.dart';

class InitialDependencies extends Bindings {
  @override
  void dependencies() {
    final envConfig = BuildConfig.instance.config;
    Get.lazyPut(() => TokenService());
    Get.lazyPut(() => HttpResponseHandler());
    Get.lazyPut(() => ApiRequestService(
        authority: envConfig.baseUrl,
        unencodePath: envConfig.unencoded,
        httpHandler: Get.find(),
        tokenService: Get.find()));
  }
}
