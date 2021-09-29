import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '/repositories/favorite_repository/favorite_repository.dart';
import '/stores/announcement_store/announcement_store.dart';
import '/stores/user_manager_store/user_manager_store.dart';

part 'favorite_store.g.dart';

class FavoriteStoreController = _FavoriteStoreControllerBase
    with _$FavoriteStoreController;

abstract class _FavoriteStoreControllerBase with Store {
  Future<void> toggleFavorite(
      AnnouncementStoreController storeController) async {
    final UserManagerStoreController userManagerStoreController =
        GetIt.I<UserManagerStoreController>();
    try {
      FavoriteRepository().save(
          announcementStoreController: storeController,
          user: userManagerStoreController.user!);
    } catch (e) {}
  }
}
