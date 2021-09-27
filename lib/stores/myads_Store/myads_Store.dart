import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '/models/model_announcement/model_announcement.dart';
import '/repositories/announcement_repository/announcement_repository.dart';
import '/stores/user_manager_store/user_manager_store.dart';

part 'myads_Store.g.dart';

class MyAdsStoreController = _MyAdsStoreControllerBase
    with _$MyAdsStoreController;

abstract class _MyAdsStoreControllerBase with Store {
  _MyAdsStoreControllerBase() {
    _getMyAds();
  }

  @observable
  List<ModelAnnouncement>? allAds = [];

  @computed
  List<ModelAnnouncement> get activeAds => allAds!
      .where(
          (element) => element.announcementStatus == AnnouncementStatus.ACTIVE)
      .toList();

  List<ModelAnnouncement> get pendingAds => allAds!
      .where(
          (element) => element.announcementStatus == AnnouncementStatus.PENDING)
      .toList();

  List<ModelAnnouncement> get soldAds => allAds!
      .where((element) => element.announcementStatus == AnnouncementStatus.SOLD)
      .toList();

  Future<void> _getMyAds() async {
    final user = GetIt.I<UserManagerStoreController>().user;
    try {
      loading = true;
      allAds = await AnnouncementRepository().getMyAds(user!);
      loading = false;
    } catch (e) {}
  }

  @observable
  bool loading = false;

  void refresh() => _getMyAds();

  void soldAd({required ModelAnnouncement modelAnnouncement}) async {
    loading = true;
    await AnnouncementRepository().sold(modelAnnouncement: ModelAnnouncement());
    refresh();
  }

  void deleteAds({required ModelAnnouncement modelAnnouncement}) async {
    loading = true;
    await AnnouncementRepository()
        .delete(modelAnnouncement: ModelAnnouncement());
    refresh();
  }
}
