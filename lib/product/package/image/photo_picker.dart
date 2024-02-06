import 'dart:io';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerHandler {
  ImagePickerHandler({
    required BuildContext context,
    required Function(dynamic) onSelectionFile,
    this.pickerType = "ProfilPhoto",
  })  : _context = context,
        _onSelectionFile = onSelectionFile;

  final BuildContext _context;
  final Function(dynamic) _onSelectionFile;
  final String pickerType;

  Future<void> handleImageSelection() async {
    const cropperName = "Kırp";
    final toolbarColor = Theme.of(_context).colorScheme.background;
    final toolbarWidgetColor = Theme.of(_context).colorScheme.primary;
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 500,
        maxWidth: 500,
        imageQuality: 40,
      );
      if (image != null) {
        if (pickerType == "ProfilePhoto") {
          CroppedFile? croppedFile = await ImageCropper().cropImage(
            sourcePath: image.path,
            aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
            aspectRatioPresets: [CropAspectRatioPreset.square],
            uiSettings: [
              AndroidUiSettings(
                toolbarTitle: cropperName,
                toolbarColor: toolbarColor,
                toolbarWidgetColor: toolbarWidgetColor,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false,
              ),
              IOSUiSettings(
                title: cropperName,
              ),
            ],
          );
          if (croppedFile != null) {
            _onSelectionFile(croppedFile);
          }
        } else {
          _onSelectionFile(File(image.path));
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
