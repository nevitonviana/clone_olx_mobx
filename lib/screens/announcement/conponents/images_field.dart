import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_clone/stores/announcement_store/announcement_store.dart';

import 'image_source_model.dart';

class ImagesField extends StatelessWidget {
  final AnnouncementStoreController announcementStoreController;
  const ImagesField({Key? key, required this.announcementStoreController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onImageSelected(File file) {
      announcementStoreController.images.add(file);
      Navigator.of(context).pop(context);
    }

    return Container(
      color: Colors.grey,
      height: 120,
      child: Observer(builder: (_) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: announcementStoreController.images.length < 5
              ? announcementStoreController.images.length + 1
              : 5,
          itemBuilder: (_, int index) {
            if (index == announcementStoreController.images.length) {
              return GestureDetector(
                onTap: () {
                  if (Platform.isAndroid) {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) => ImageSourceModel(
                        onImageSelected: onImageSelected,
                      ),
                    );
                  } else {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (_) =>
                          ImageSourceModel(onImageSelected: onImageSelected),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                  child: CircleAvatar(
                    radius: 44,
                    backgroundColor: Colors.grey[300],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_a_photo,
                          size: 50,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                child: CircleAvatar(
                  radius: 44,
                  backgroundImage:
                      FileImage(announcementStoreController.images[index]),
                ),
              );
            }
          },
        );
      }),
    );
  }
}
