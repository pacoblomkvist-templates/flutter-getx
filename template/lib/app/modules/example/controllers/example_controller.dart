import 'package:get/get.dart';
import 'package:template/app/common/base/base_controller.dart';
import 'package:template/app/modules/example/repositories/example_repository.dart';

import '../../../common/models/page_state.dart';

class ExampleController extends BaseController {
  final ExampleRepository repo;
  ExampleController({required this.repo});
  @override
  void onInit() async {
    super.onInit();
    callDataService(repo.getExample());
  }
}
