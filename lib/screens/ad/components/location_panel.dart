import 'package:flutter/material.dart';

import '/stores/announcement_store/announcement_store.dart';

class LocationPanel extends StatelessWidget {
  final AnnouncementStoreController announcementStoreController;

  const LocationPanel({Key? key, required this.announcementStoreController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 18,
            bottom: 18,
          ),
          child: Text(
            "localização ",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("CEP"),
                  SizedBox(
                    height: 12,
                  ),
                  Text("Municipio"),
                  SizedBox(
                    height: 12,
                  ),
                  Text("Bairro"),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(announcementStoreController.address!.cep),
                          SizedBox(
                            height: 12,
                          ),
                          Text(announcementStoreController.address!.city.name!),
                          SizedBox(
                            height: 12,
                          ),
                          Text(announcementStoreController.address!.district),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
