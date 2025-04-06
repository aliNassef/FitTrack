import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

abstract class ImagePickerHelper {
  static void openImagePicker({
    required ValueChanged<File> onGet,
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      builder: (_) {
        return CupertinoAlertDialog(
          title: Center(
            child: Text(
              'Select Image Source',
              style: AppStyles.regular18.copyWith(
                color: AppColors.darkBlueColor,
              ),
            ),
          ),
          actions: [
            CupertinoDialogAction(
                child: Text(
                  'Gallery',
                ),
                onPressed: () => openGallery(onGet: onGet)),
            CupertinoDialogAction(
                child: Text('Camera'),
                onPressed: () => openCamera(onGet: onGet)),
          ],
        );
      },
    );
  }

  static Future<void> openGallery({
    required ValueChanged<File> onGet,
  }) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      onGet(File(image.path));
    }
  }

  static Future<void> openCamera({
    required ValueChanged<File> onGet,
  }) async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      onGet(File(image.path));
    }
  }
}
