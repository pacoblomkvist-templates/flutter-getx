import 'package:get/get.dart';
import 'package:template/app/common/base/base_controller.dart';

import '../../../common/models/page_state.dart';

class ExampleController extends BaseController {
  @override
  void onInit() async {
    updatePageState(PageState.LOADING);
    await Future.delayed(Duration(seconds: 5));
    updatePageState(PageState.DEFAULT);
    super.onInit();
  }
}
