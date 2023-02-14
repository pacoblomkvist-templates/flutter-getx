import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'scroll_notifier.dart';

class RefreshableListView extends StatelessWidget {
  final Widget Function(BuildContext, int) builder;
  final int itemCount;
  final Function? onEndOfScrolling;
  final Future<void> Function() onRefreshList;
  final bool? triggerBottomScrollingCondition;
  final EdgeInsets? padding;

  const RefreshableListView(
      {required this.builder,
      required this.itemCount,
      this.onEndOfScrolling,
      this.triggerBottomScrollingCondition,
      this.padding,
      required this.onRefreshList,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefreshList,
      child: ScrollNotifier(
        bottomFunction: onEndOfScrolling,
        bottomScrollCondition: triggerBottomScrollingCondition,
        child: ListView.separated(
          padding: padding,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 2.h,
            );
          },
          shrinkWrap: false,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: builder,
          itemCount: itemCount,
        ),
      ),
    );
  }
}
