import 'package:flutter/material.dart';

import '/models/model_announcement/model_announcement.dart';
import '/stores/myads_Store/myads_Store.dart';

class SoldTile extends StatelessWidget {
  final ModelAnnouncement modelAnnouncement;
  final MyAdsStoreController myAdsStoreController;

  const SoldTile({Key? key, required this.modelAnnouncement, required this.myAdsStoreController}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 80,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                modelAnnouncement.images!.first,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      modelAnnouncement.title!,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      modelAnnouncement.price.toString(),
                    ),
                    Text(
                      "Vendido",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    myAdsStoreController.deleteAds(
                        modelAnnouncement: modelAnnouncement);
                  },
                  icon: Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                    size: 22,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
