import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../app_colors.dart';

class DropdownSelectorWidget<T> extends StatelessWidget {
  final Widget Function(T obj) selectorItem;
  final List<T> items;
  final T? selectedValue;
  void Function(T? obj) onChanged;
  DropdownSelectorWidget(
      {Key? key,
      required this.selectorItem,
      required this.items,
      required this.selectedValue,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.colorPrimary, width: 0.5.w),
            color: AppColors.pageBackground,
            borderRadius: BorderRadius.circular(1.w)),
        width: 100.w,
        margin: EdgeInsets.symmetric(vertical: .5.h),
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
                items: items
                    .map(
                      (e) => DropdownMenuItem<T>(
                        value: e,
                        child: selectorItem(e),
                      ),
                    )
                    .toList(),
                onChanged: (e) {
                  onChanged(e);
                },
                value: selectedValue)));
  }
}
