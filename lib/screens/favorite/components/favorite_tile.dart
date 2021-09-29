import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:olx_clone/screens/ad/ad_screen.dart';
import 'package:olx_clone/stores/announcement_store/announcement_store.dart';

import '/stores/favorite_store/favorite_store.dart';

class FavoriteTile extends StatelessWidget {
  final FavoriteStoreController favoriteStoreController;

  const FavoriteTile({Key? key, required this.favoriteStoreController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AnnouncementStoreController announcementStoreController =
        AnnouncementStoreController();
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => AdScreen(
              announcementStoreController: announcementStoreController),
        ),
      ),
      child: Container(
        height: 135,
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 9,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              SizedBox(
                height: 135,
                width: 127,
                child: CachedNetworkImage(
                  imageUrl: announcementStoreController.images.isEmpty
                      ? ""
                      : announcementStoreController.images.first,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        announcementStoreController.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        announcementStoreController.priceText,
                        style: TextStyle(),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${announcementStoreController.address!.city.name} - ${announcementStoreController.address!.uf.initials}',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
