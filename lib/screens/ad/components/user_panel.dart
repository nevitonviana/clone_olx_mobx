import 'package:flutter/material.dart';

import '/stores/announcement_store/announcement_store.dart';

class UserPanel extends StatelessWidget {
  final AnnouncementStoreController announcementStoreController;

  const UserPanel({Key? key, required this.announcementStoreController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 18,
            bottom: 18,
          ),
          child: Text(
            "Anunciante",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "announcementStoreController.user.name",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Text(
                "Na oxl Desde {announcementStoreController.user.}",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
