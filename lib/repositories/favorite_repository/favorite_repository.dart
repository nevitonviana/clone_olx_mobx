import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '/models/user/user.dart';
import '/repositories/parse_errors/parse_errors.dart';
import '/stores/announcement_store/announcement_store.dart';
import '../table_keys.dart';

class FavoriteRepository {
  Future<List<AnnouncementStoreController>> getFavorite(
      {required User user}) async {
    try {
      final queryBuild =
          QueryBuilder<ParseObject>(ParseObject(keyFavoritesTable));
      queryBuild.whereEqualTo(keyFavoritesOwner, user.id);
      queryBuild.includeObject([keyFavoritesAd, 'ad.owner']);
      final response = await queryBuild.query();
      if (response.success && response.results != null) {
        return []; //"response.results.map((e) => e.toString())"
      } else if (response.success && response.results == null) {
        return [];
      } else {
        return Future.error(
            ParseErrors.getDescription(response.error!.code).toString());
      }
    } catch (e) {
      return [];
    }
  }

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

  Future<void> delete(
      {required AnnouncementStoreController announcementStoreController,
      required User user}) async {
    try {
      final queryBuild =
          QueryBuilder<ParseObject>(ParseObject(keyFavoritesTable));
      queryBuild.whereEqualTo(keyFavoritesOwner, user.id);
      queryBuild.whereEqualTo(
          keyFavoritesAd,
          ParseObject(keyAdTable)
            ..set(keyAdId, announcementStoreController.modelAnnouncement!.id));

      final response = await queryBuild.query();

      if (response.success && response.results != null) {
        for (final f in response.results as List<ParseObject>) {
          await f.delete();
        }
      }
    } catch (e) {
      return Future.error("falha ao deleta favorito");
    }
  }
}
