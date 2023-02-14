import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class ImagePickerWidget extends StatelessWidget {
  final ImagePickerController controller;
  final double width;
  final double height;
  ImagePickerWidget(
      {super.key,
      required this.controller,
      required this.width,
      required this.height});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final source = await _showImageOptionDialog(context);
        if (source != null) await controller.pickImage(source);
      },
      child: SizedBox(
          width: width,
          height: height,
          child: Obx(() => _getImageOrPlaceholder())),
    );
  }

  Future<ImageSource?> _showImageOptionDialog(BuildContext context) async {
    ImageSource? source;
    await Get.dialog(Center(
        child: Card(
            child: SizedBox(
      height: 10.h,
      width: 35.w,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  source = ImageSource.camera;
                },
                icon: Icon(
                  Icons.photo_camera,
                  size: 4.h,
                )),
          ),
          Expanded(
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  source = ImageSource.gallery;
                },
                icon: Icon(
                  Icons.photo_album,
                  size: 4.h,
                )),
          )
        ],
      ),
    ))));

    return source;
  }

  Widget _getImageOrPlaceholder() {
    if (controller.image != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.file(
          File(controller.image!.path),
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(8)),
        child: Icon(
          Icons.image,
          size: 8.w,
        ),
      );
    }
  }
}

class ImagePickerController extends GetxController {
  XFile? get image => _image.value;
  final _image = Rx<XFile?>(null);
  bool get picked => image != null;
  final ImagePicker _picker = ImagePicker();
  Future pickImage(ImageSource source) async {
    _image.value = await _picker.pickImage(source: source);
  }
}
