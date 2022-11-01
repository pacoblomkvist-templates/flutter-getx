import 'package:get/get.dart';
import 'package:template/app/modules/example/repositories/example_repository.dart';

import 'controllers/example_controller.dart';

class ExampleDependencies extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExampleRepository());
    Get.lazyPut(() => ExampleController(repo: Get.find()));
  }
}
