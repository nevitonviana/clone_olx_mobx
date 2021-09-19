import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'image_source_model.dart';

class ImagesField extends StatelessWidget {
  const ImagesField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onImageSelected(File file) {
      Navigator.of(context).pop(context);
    }

    return Container(
      color: Colors.grey,
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (_, int index) {
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
        },
      ),
    );
  }
}
