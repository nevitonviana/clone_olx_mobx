import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/models/model_announcement/model_announcement.dart';

class ActiveTile extends StatelessWidget {
  final ModelAnnouncement modelAnnouncement;

  const ActiveTile({Key? key, required this.modelAnnouncement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<MenuChoice> choice = [
      MenuChoice(index: 0, title: "Editar", iconData: Icons.edit),
      MenuChoice(index: 0, title: "Já vendi", iconData: Icons.thumb_up_alt),
      MenuChoice(index: 0, title: "Deleta", iconData: Icons.delete_forever),
    ];

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
                      "${modelAnnouncement.views}",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey[800],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                PopupMenuButton<MenuChoice>(
                  onSelected: (value) {
                    switch (value.index) {
                      case 0:
                        break;
                      case 1:
                        break;
                      case 2:
                        break;
                    }
                  },
                  icon: Icon(
                    Icons.more_vert_rounded,
                    color: Colors.purple,
                  ),
                  itemBuilder: (context) {
                    return choice
                        .map(
                          (e) => PopupMenuItem<MenuChoice>(
                            value: e,
                            child: Row(
                              children: [
                                Icon(
                                  e.iconData,
                                  size: 20,
                                  color: Colors.purple,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  e.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.purple),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MenuChoice {
  final int index;
  final String title;
  final IconData iconData;

  MenuChoice({
    required this.index,
    required this.title,
    required this.iconData,
  });
}
