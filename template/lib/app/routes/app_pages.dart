import 'package:get/get.dart';
import 'package:template/app/modules/example/DI.dart';
import 'package:template/app/modules/example/views/example_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.EXAMPLE;

  static final routes = [
    GetPage(
      name: Routes.EXAMPLE,
      page: () => ExampleView(),
      binding: ExampleDependencies(),
    ),
  ];
}
