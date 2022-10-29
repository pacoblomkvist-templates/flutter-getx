import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:template/app/common/base/base_view.dart';

import '../controllers/example_controller.dart';

class ExampleView extends BaseView<ExampleController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text("Example"),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      child: Text("This is an example"),
    );
  }
}
