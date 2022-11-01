import 'package:get/get.dart';
import 'package:template/app/common/api/api_request_service.dart';

abstract class BaseApiRepository {
  final ApiRequestService apiService = Get.find();
}
