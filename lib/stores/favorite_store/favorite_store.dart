import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '/repositories/favorite_repository/favorite_repository.dart';
import '/stores/announcement_store/announcement_store.dart';
import '/stores/user_manager_store/user_manager_store.dart';

part 'favorite_store.g.dart';

class FavoriteStoreController = _FavoriteStoreControllerBase
    with _$FavoriteStoreController;

abstract class _FavoriteStoreControllerBase with Store {
  _FavoriteStoreControllerBase() {
    reaction((_) => userManagerStoreController.isLoggedIn,
        (_) => _getFavoriteList());
  }

  final UserManagerStoreController userManagerStoreController =
      GetIt.I<UserManagerStoreController>();
  ObservableList<AnnouncementStoreController> favoriteList =
      ObservableList<AnnouncementStoreController>();

  @action
  Future<void> _getFavoriteList() async {
    try {
      final favorites = FavoriteRepository()
          .getFavorite(user: userManagerStoreController.user!);

      // favoriteList.addAll(favorites);
    } catch (e) {}
  }

  @action
  Future<void> toggleFavorite(
      AnnouncementStoreController storeController) async {
    final UserManagerStoreController userManagerStoreController =
        GetIt.I<UserManagerStoreController>();
    try {
      favoriteList.clear();
      if (favoriteList.any((element) =>
          element.modelAnnouncement!.id ==
          storeController.modelAnnouncement!.id)) {
        favoriteList.removeWhere((element) =>
            element.modelAnnouncement!.id ==
            storeController.modelAnnouncement!.id);
        FavoriteRepository().delete(
            announcementStoreController: storeController,
            user: userManagerStoreController.user!);
      } else {
        favoriteList.add(storeController);
        FavoriteRepository().save(
            announcementStoreController: storeController,
            user: userManagerStoreController.user!);
      }
    } catch (e) {}
  }
}
