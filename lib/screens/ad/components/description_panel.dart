import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '/stores/announcement_store/announcement_store.dart';

class DescriptionPanel extends StatelessWidget {
  final AnnouncementStoreController announcementStoreController;

  const DescriptionPanel({Key? key, required this.announcementStoreController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 18,
          ),
          child: Text(
            "Descrição",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: ReadMoreText(
            announcementStoreController.description,
            trimLines: 3,
            trimMode: TrimMode.Line,
            trimCollapsedText: "ver Descrição completa",
            trimExpandedText: "ver menos",
            colorClickableText: Colors.purple,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
