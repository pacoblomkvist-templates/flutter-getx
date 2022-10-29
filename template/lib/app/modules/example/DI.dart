import 'package:get/get.dart';

import 'controllers/example_controller.dart';

class ExampleDependencies extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExampleController());
  }
}
