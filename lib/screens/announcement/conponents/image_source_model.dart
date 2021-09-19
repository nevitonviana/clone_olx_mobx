import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceModel extends StatelessWidget {
  final Function(File) onImageSelected;

  ImageSourceModel({Key? key, required this.onImageSelected}) : super(key: key);

  final ImagePicker _picker = ImagePicker();

  Future<void> getFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image == null) return;
    imageSelected(image);
  }

  Future<void> getFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    imageSelected(image);
  }

  Future<void> imageSelected(XFile xFile) async {
    final croppedFile = await ImageCropper.cropImage(
      sourcePath: xFile.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Editar Image',
          toolbarColor: Colors.purple,
          toolbarWidgetColor: Colors.white),
      iosUiSettings: IOSUiSettings(
        title: "Editar",
        cancelButtonTitle: 'Cancelar',
        doneButtonTitle: 'Concluir',
      ),
    );
    onImageSelected(croppedFile!);
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return BottomSheet(
        elevation: 8,
        onClosing: () {},
        builder: (_) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextButton(
              onPressed: getFromCamera,
              child: Text("Câmera"),
            ),
            TextButton(
              onPressed: getFromGallery,
              child: Text("Galeria"),
            ),
          ],
        ),
      );
    } else {
      return CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: getFromCamera,
            child: Text("Câmera"),
          ),
          CupertinoActionSheetAction(
            onPressed: getFromGallery,
            child: Text("Galeria"),
          ),
        ],
      );
    }
  }
}
