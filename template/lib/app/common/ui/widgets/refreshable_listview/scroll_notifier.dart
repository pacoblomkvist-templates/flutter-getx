import 'package:flutter/material.dart';

class ScrollNotifier extends StatelessWidget {
  final Widget child;
  final bool? bottomScrollCondition;
  final bool? topScrollCondition;
  final Function? bottomFunction;
  final Function? topFunction;
  const ScrollNotifier(
      {required this.child,
      this.bottomScrollCondition,
      this.topScrollCondition,
      this.bottomFunction,
      this.topFunction,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if ((bottomScrollCondition ?? true) &&
              scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            if (bottomFunction != null) {
              bottomFunction!();
            }
          }
          return false;
        },
        child: child);
  }
}
