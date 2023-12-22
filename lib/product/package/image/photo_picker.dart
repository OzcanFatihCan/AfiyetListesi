import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerHandler {
  ImagePickerHandler({
    required BuildContext context,
    required Function(CroppedFile) onCroppedFile,
  })  : _context = context,
        _onCroppedFile = onCroppedFile;

  final BuildContext _context;
  final Function(CroppedFile) _onCroppedFile;

  Future<void> handleImageSelection() async {
    const cropperName = "Kırp";
    final toolbarColor = Theme.of(_context).colorScheme.background;
    final toolbarWidgetColor = Theme.of(_context).colorScheme.primary;
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 500,
      maxWidth: 500,
      imageQuality: 40,
    );
    if (image != null) {
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
        _onCroppedFile(croppedFile);
      }
    }
  }
}
