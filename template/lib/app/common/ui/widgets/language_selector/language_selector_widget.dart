import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:template/app/common/ui/app_colors.dart';

import 'language_model.dart';
import 'language_selector_controller.dart';

class LanguageSelector extends StatelessWidget {
  final LanguageSelectorController controller;
  final Future Function(LanguageModel?, BuildContext? context)? onSelect;
  bool border;
  double? width;
  LanguageSelector(
      {Key? key,
      required this.controller,
      this.border = false,
      this.width,
      this.onSelect})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.init(context);
    return Obx(() => Container(
          decoration: border
              ? BoxDecoration(
                  border:
                      Border.all(color: AppColors.colorPrimary, width: 0.5.w),
                  color: AppColors.colorPrimary,
                  borderRadius: BorderRadius.circular(1.w))
              : null,
          width: width,
          child: DropdownButtonHideUnderline(
              child: DropdownButton<LanguageModel>(
                  items: controller.languages
                      .map(
                        (e) => DropdownMenuItem<LanguageModel>(
                          alignment: Alignment.centerRight,
                          value: e,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 3.w,
                              ),
                              Text(e.nameNative ?? "")
                            ],
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (e) async {
                    await controller.selectLanguage(e ?? LanguageModel());
                    if (!(onSelect == null)) await onSelect!(e, context);
                  },
                  value: controller.selectedLanguage)),
        ));
  }
}
