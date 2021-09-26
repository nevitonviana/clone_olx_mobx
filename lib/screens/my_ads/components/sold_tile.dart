import 'package:flutter/material.dart';

import '/models/model_announcement/model_announcement.dart';

class SoldTile extends StatelessWidget {
  final ModelAnnouncement modelAnnouncement;

  const SoldTile({Key? key, required this.modelAnnouncement}) : super(key: key);

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
                  onPressed: () {},
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
