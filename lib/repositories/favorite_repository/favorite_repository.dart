import 'package:olx_clone/repositories/parse_errors/parse_errors.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '/models/user/user.dart';
import '/stores/announcement_store/announcement_store.dart';
import '../table_keys.dart';

class FavoriteRepository {
  Future<void> save(
      {required AnnouncementStoreController announcementStoreController,
      required User user}) async {
    final favoriteObject = ParseObject(keyFavoritesTable);
    favoriteObject.set<String>(keyFavoritesOwner, user.id!);
    favoriteObject.set<ParseObject>(
        keyFavoritesAd,
        ParseObject(keyAdTable)
          ..set(keyAdId, announcementStoreController.modelAnnouncement!.id));

    final response = await favoriteObject.save();

    if (!response.success) {
      return Future.error(
          ParseErrors.getDescription(response.error!.code).toString());
    }
  }
}
