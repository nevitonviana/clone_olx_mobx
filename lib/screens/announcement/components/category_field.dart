import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '/screens/category_screen/category_screen.dart';
import '/stores/announcement_store/announcement_store.dart';

class CategoryField extends StatelessWidget {
  final AnnouncementStoreController announcementStoreController;

  const CategoryField({Key? key, required this.announcementStoreController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Column(
          children: [
            ListTile(
              title: Text(
                "Categoria *",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                  fontSize:
                      announcementStoreController.category == null ? 18 : 13,
                ),
              ),
              subtitle: announcementStoreController.category == null
                  ? null
                  : Text(
                      "${announcementStoreController.category!.description}",
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    ),
              trailing: Icon(Icons.keyboard_arrow_down_rounded),
              onTap: () async {
                final category = await showDialog(
                  context: context,
                  builder: (_) => CategoryScreen(
                    showAll: false,
                    selected: announcementStoreController.category,
                  ),
                );
                if (category != null) {
                  announcementStoreController.setCategory(category);
                }
              },
            ),
            if (announcementStoreController.categoryError != null)
              Container(
                padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.red),
                  ),
                ),
                child: Text(
                  '${announcementStoreController.categoryError}',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              )
            else
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey.shade500),
                  ),
                ),
              )
          ],
        );
      },
    );
  }
}
