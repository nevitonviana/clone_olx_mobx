import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_clone/stores/announcement_store/announcement_store.dart';

class HidePhoneField extends StatelessWidget {
  final AnnouncementStoreController announcementStoreController;
  const HidePhoneField({Key? key, required this.announcementStoreController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Row(
        children: [
          Observer(
            builder: (_) => Checkbox(
              activeColor: Colors.purple,
              value: announcementStoreController.hidePhone,
              onChanged: (value) =>
                  announcementStoreController.setHidePhone(value!),
            ),
          ),
          Expanded(
            child: Text(
              "Ocutar o meu numero de telefone neste anúncio",
            ),
          ),
        ],
      ),
    );
  }
}
