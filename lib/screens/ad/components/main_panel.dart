import 'package:flutter/material.dart';

import '/stores/announcement_store/announcement_store.dart';

class MainPanel extends StatelessWidget {
  final AnnouncementStoreController announcementStoreController;

  const MainPanel({Key? key, required this.announcementStoreController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 24,
            bottom: 14,
          ),
          child: Text(
            announcementStoreController.priceText,
            style: TextStyle(
              fontSize: 34,
              letterSpacing: 2.8,
              fontWeight: FontWeight.w300,
              color: Colors.grey[800],
            ),
          ),
        ),
        Text(
          announcementStoreController.title,
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 1,
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 18,
          ),
          child: Text(
            "Publicado }",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey[600],
            ),
          ),
        ),
      ],
    );
  }
}
